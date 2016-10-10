class ApplicationNotificationMailer < ApplicationMailer

  def notification_email(user)
    @user = user
    @url  = '/listings/#{@listing.id}'
    mail(to: @user.email, subject: 'Application for Job Listing')
  end

end
