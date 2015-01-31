module ApplicationHelper
	# Returns the full title on a per-page basis.
	include Flot

	def full_title(page_title)
		base_title = "Kakoona AdPortal v1.0"
		if page_title.empty?
		  base_title
		else
		  "#{base_title} | #{page_title}"
		end
	end
end
