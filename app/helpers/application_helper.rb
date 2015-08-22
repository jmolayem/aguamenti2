module ApplicationHelper
	def current_page_class
		"#{controller_name} #{action_name}"
	end
end
