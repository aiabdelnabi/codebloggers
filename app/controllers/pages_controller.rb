class PagesController < ApplicationController

  def index
  	@articles = Article.paginate(page: params[:page])
  end 

  def about
  end
end
