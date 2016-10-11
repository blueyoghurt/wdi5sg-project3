class ApplicationNotificationMailer < ApplicationMailer

  def notification_email(listing_id)
    @user = User.find_by(id: Bizowner.find_by(id: Listing.find_by(id: listing_id).bizowner_id).user_id)
    @url  = '/applications/#{@application.id}/edit'
    mail(to: @user.email, subject: 'Application for Job Listing')
  end

end
