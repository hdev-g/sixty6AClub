class PagesController < ApplicationController
  def home
    @markers = [{
      lat: 55.95794206181086,
      lng: -3.206466979961612
    }]
  end

  def pricing
  end

  def contact
  end

  def dashboard
  end
end
