class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show]
  before_action :owner, only: [:edit, :update]

  def show
    @article = Article.find(params[:id])
  end

  def new
  	@article = current_user.articles.build
  end

  def create
  	@article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article Posted Successfully"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went Wrong while saving the Article"
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if(@article.update_attributes(article_params))
      flash[:success] = "article successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end

  end

  private

  	def article_params
  		params.require(:article).permit(:title, :content, :picture, :tag_list)
  	end

    def owner
      @article = Article.find(params[:id])
      unless current_user == @article.user
        redirect_to root_path
      end 
    end
end
