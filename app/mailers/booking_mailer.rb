class BookingMailer < ApplicationMailer
  def booking_confirmation(user, booking)
    @user = user
    @booking = booking
    mail(to: user.email, subject: 'Booking Confirmation')
  end

  def admin_notification(admin_email, booking)
    @booking = booking
    mail(to: admin_email, subject: 'New Booking Notification')
  end
end
