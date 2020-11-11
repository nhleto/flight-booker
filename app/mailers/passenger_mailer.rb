class PassengerMailer < ApplicationMailer
  def thank_you_email
    @booking = params[:booking]
    @passengers = @booking.passengers
    @pass_emails = @passengers.map(&:email)
    @url = "http://localhost:3000/bookings/#{@booking.id}"
    mail(to: @pass_emails, subject: 'Ticket Confirmation')
  end
end
