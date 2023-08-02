class ReportsController < ApplicationController

  def index
  end

  def users
    @users = User.all.order(created_at: :asc)
  end

  def bookings
    @bookings = Booking.all.order(date: :asc)
  end

end
