module ApplicationHelper
	#Returns full title on a per-page basis.
	def full_title(page_title)
		base_title = "The Sarmander"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def highlight(path)
		"menu-item-divided pure-menu-selected" if current_page?(path)
	end
end
