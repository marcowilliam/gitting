# File name :: application_mailer.rb
# Description :: Class ApplicationMailer is a class
# to create a mailer, to contact the developer team

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
