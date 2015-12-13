class TagsController < ApplicationController
	def show
		@articles = current_user.articles.tagged_with(params[:id]).paginate(page: params[:page])
	end
end
