class WelcomeController < ApplicationController
  def index
  end

  def message
    @message = Message.new(params[:message])

      NotificationsMailer.email(@message).deliver
      redirect_to root_path
  end
end
