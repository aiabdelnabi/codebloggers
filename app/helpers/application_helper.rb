module ApplicationHelper

	def bootstrap_class_new_name(old_name)
		if old_name.include?("notice")
			"alert alert-info"
		elsif old_name.include?("alert")
			"alert alert-warning"
		else
			"alert alert-#{old_name}"
		end
	end

	def tags
	  Article.tag_counts.take(5)
	end
end
