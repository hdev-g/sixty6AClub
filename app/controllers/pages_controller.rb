class PagesController < ApplicationController
  def pricing
  end

  def contact
  end

  def dashboard
  end

  def reports
  end

  def privacy_policy
    @updated_at = '27/09/2023'
    @company_name = 'East Mains Capital Advisory Ltd'
    @trading_name = 'kinda.works'
    @website_url = 'www.kinda.works'
    @contact_email = 'info@kinda.works'
    @street_address = '66A St Stephen Street'
    @city = 'Edinburgh'
    @country = 'United Kingdom'
    @postcode = 'EH3 5AQ'
  end
end
