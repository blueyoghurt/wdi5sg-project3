class ApplicationNotificationMailer < ApplicationMailer

  def notification_email(listing_id)
    @user = User.find_by(id: listing_id)
    @url  = '/applications/#{@application.id}/edit'
    puts "email to send to is",@user.email
    mail(to: @user.email, subject: 'Application for Job Listing')
  end

end
