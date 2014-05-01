class NotificationsMailer < ActionMailer::Base
  default from: "noreply@rcackerman.com"

  def email(message)
    @message = message
    mail(:to => "ackerman.ro@gmail.com", :subject => @message.subject)
  end
end
