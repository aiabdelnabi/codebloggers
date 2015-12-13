module ArticlesHelper

	def article_owner?(user)
		current_user == user ? true : false
	end
end
