class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.desk = Desk.last
    if capacity_full_for_date?(@booking.date)
      flash[:alert] = "There is no desks available on this date. Please choose another date."
      redirect_to user_dashboard_path
    elsif @booking.save
      flash[:notice] = "Booking created successfully!"
      redirect_to user_dashboard_path
    else
      flash[:alert] = "Booking could not be created. Please check the form and try again."
      redirect_to user_dashboard_path
    end
  end

  def upcoming_bookings
    user = current_user
    @upcoming_bookings = user.bookings.where("date > ?", Date.today)
  end

  def destroy
    @user = current_user
    @booking = @user.bookings.find(params[:id])
    if current_user == @booking.user # || current_user.is_admin?
      @booking.destroy
      redirect_to user_dashboard_path
      flash[:notice] = "Your booking was deleted successfully!"
    else
      flash[:alert] = "Your are not authorized to delete this booking!"
    end
  end

  def desks_available
    date = params[:date]
    # Call the Ruby method that calculates the available days
    # Replace 'calculate_available_days' with the actual method name in your code
    available_desks = desks_available_days(date)

    render json: { desks_available: available_desks }
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :desk)
  end

  def capacity_full_for_date?(date)
    # Implement logic to check if the capacity is full for the given date
    booked_capacity = Booking.where(date: date)
    available_capacity = @booking.desk.capacity - booked_capacity.count
    return available_capacity <= 0
  end

  def desks_available_days(date)
    booked_capacity = Booking.where(date: date)
    # @booking.desk.capacity
    4 - booked_capacity.count
  end
end
