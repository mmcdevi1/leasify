class WizardsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_subdomain
	before_action :set_wizard
	before_action :set_subdomain
	before_action :redirect_if_www

	def templates
		
	end

	def customize
		
	end

	def homepage_content
		
	end

	def property_information
		@propertyinformations = PropertyInformation.where(site_id: @site.id).first
  end

	def property_address
		@propertyinformations = PropertyInformation.where(site_id: @site.id).first
	end

	def property_amenities
		@propertyinformations = PropertyInformation.where(site_id: @site.id).first
		@amenities_common = Amenity.where(category: "Common")
    @amenities_extra = Amenity.where(category: "Extra")
	end

	def homepage_gallery
		@homepage_gallery    = HomepageGallery.where(site_id: @site.id).first
    @homepage_galleries  = HomepageGallery.where(site_id: @site.id).all
    @themeoptions.homepage_galleries.build
	end

	def new_page
		@page = Page.new
	end

	def almost_finished

	end

	


	private

		def set_wizard
			if request.subdomain.present? && request.subdomain != "www"
				@themeoptions = ThemeOption.where(user_id: current_user.id).first && ThemeOption.where(site_id: @site.id).first
				@templates = ThemeName.where(published: true).all
			end
		end

		def set_subdomain
			if request.subdomain.present? && request.subdomain != "www"
				@subdomain           = request.subdomain
				@site                = Site.where(subdomain: request.subdomain).first
				@user                = User.where(id: @site.user_id).first
				@pages               = Page.where(site_id: @site.id).all
				@availabilities      = Availability.where(site_id: @site.id).all
				@propertyinformation = PropertyInformation.where(site_id: @site.id).first
				@contacts            = Contact.where(site_id: @site.id).all
			end
		end

		def redirect_if_www
      if !request.subdomain.present? || request.subdomain == "www"
        redirect_to dashboard_path
      end
    end

end
