# Preview all emails at http://localhost:3000/rails/mailers/application_notification_mailer
class ApplicationNotificationMailerPreview < ActionMailer::Preview
  def notification_email
    ApplicationNotificationMailer.notification_email(User.first)
  end
end
