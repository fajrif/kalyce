module ApplicationHelper

	def mobile_device?
		request.user_agent =~ /Mobile|webOS/
	end

	def get_latest_year_options(num=5)
		current_year = Date.today.year
		years = []
		num.times do |n|
			years << current_year - n
		end
		years
	end

	def truncate_text(title, length=30)
		truncate(title, length: length, omission: "...")
  end

	def truncate_paragraph(desc, length=0)
		if length > 0
			truncate(Nokogiri::HTML.parse(desc).css('div')[0].text, length: length, omission: "...")
		else
			Nokogiri::HTML.parse(desc).css('div')[0].text
		end
  end

  def set_bg_menu
    bg_menu = "bg-menu-home"
    if is_home_page?
      return bg_menu
    end
    if is_about_page?
      bg_menu = "bg-menu-about"
      return bg_menu
    end
    if is_treatments_page?
      bg_menu = "bg-menu-treatments"
      return bg_menu
    end
    if is_practitioners_page?
      bg_menu = "bg-menu-practitioners"
      return bg_menu
    end
    if is_journals_page?
      bg_menu = "bg-menu-journals"
      return bg_menu
    end
    if is_contact_page?
      bg_menu = "bg-menu-contact"
      return bg_menu
    end
    return bg_menu
  end

	def is_home_page?
		controller.controller_name == "home" && controller.action_name == "index"
	end

	def is_about_page?
		controller.controller_name == "home" && controller.action_name == "about"
	end

	def is_facilities_page?
		controller.controller_name == "facilities"
	end

	def is_journals_page?
		controller.controller_name == "articles"
	end

	def is_practitioners_page?
		controller.controller_name == "doctors"
	end

	def is_contact_page?
		controller.controller_name == "contacts"
	end

end
