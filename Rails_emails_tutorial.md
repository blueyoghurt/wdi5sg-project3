#Introduction

In this article we will walk through a simple app to demonstrate how to send emails through a Rails application with ActionMailer, ActionMailer Preview, and through a third party email service provider such as Gmail or Mailgun. We will also demostrate how to use Active Job to send the email with a background processor.

You can find the code for this tutorial here

##Sending Emails Using ActionMailer and Gmail

Now we will build a rails application which will send an email to the user when a new user is created. Let’s create a new rails application.

$ rails new new_app_name
$ rails g scaffold user name:string email:string
$ rake db:migrate

We now have a basic application, let’s make use of ActionMailer. The mailer generator is similar to any other generator in rails.

$ rails g mailer example_mailer
create  app/mailers/example_mailer.rb
invoke  erb
create    app/views/example_mailer
invoke  test_unit
create    test/mailers/example_mailer_test.rb
create    test/mailers/previews/example_mailer_preview.rb
Our application is currently using Rails 4.2.0.beta4 so the rails generator has created preview files for our application by default as test/mailers/previews/example_mailer_preview.rb which we will be using later.

app/mailers/example_mailer.rb

class ExampleMailer < ActionMailer::Base
  default from: "from@example.com"
end

Now let’s write methods and customized email. First you should change the default email address from from@example.com to the email address you want use as the sender’s address.

class ExampleMailer < ActionMailer::Base
  default from: "from@example.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
sample_email takes user parameters and sends email using method mail to email address of user. In case you want to know about more features like attachment and multiple receivers, you can check out rails guide in the reference section. Now let’s write the mail we want to send to our users, and this can be done in app/views/example_mailer. Create a file sample_email.html.erb which is an email formatted in HTML.

app/views/example_mailer/sample_email.html.erb

<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Hi <%= @user.name %></h1>
    <p>
      Sample mail sent using smtp.
    </p>
  </body>
</html>
We also need to create the text part for this email as not all clients prefer HTML emails. Create sample_email.text.erb in the app/views/example_mailer directory.

app/views/example_mailer/sample_email.text.erb

Hi <%= @user.name %>
Sample mail sent using smtp.
In the development environment we can use ActionMailer Preview to test our application. We are going to use the test/mailers/previews/example_mailer_preview.rb file created while generating mailers. We will just call any user (first user in this case) to preview the email.

test/mailers/previews/example_mailer_preview.rb


# Preview all emails at http://localhost:3000/rails/mailers/example_mailer

class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ExampleMailer.sample_email(User.first)
  end
end

When you visit http://localhost:3000/rails/mailers/example_mailer/sample_mail_preview you will see preview of the email. By default email previews are placed in test/mailers/previews. You can change this by setting up different a path in /config/environments/development.rb. Just set config.action_mailer.preview_path to the desired path and add preview file to the corresponding location.


Source:
https://launchschool.com/blog/handling-emails-in-rails
