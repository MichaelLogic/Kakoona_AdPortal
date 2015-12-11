module ApplicationHelper
	# Returns the full title on a per-page basis.
	#include Flot

	def full_title(page_title)
		base_title = "Kakoona AdPortal v1.0"
		if page_title.empty?
		  base_title
		else
		  "#{base_title} | #{page_title}"
		end
	end

	def date_for_display(date)
	    fsdate = (date == nil)? date :  I18n.l( DateTime.parse(date.localtime.to_s), format: :full)
	end

	def date_for_edit(date)
	    fsdate = (date == nil)? date :  I18n.l( DateTime.parse(date.localtime.to_s), format: :edit_mode)
	end

  
end
