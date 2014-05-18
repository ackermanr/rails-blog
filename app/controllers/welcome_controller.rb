class WelcomeController < ApplicationController
  def index
    Octokit.configure do |c|
      c.login = 'username'
      c.password = 'password'
    end

    user = Octokit.user 'ackermanr'
    @repos = user.rels[:repos].get.data

  end

  def message
    @message = Message.new(params[:message])

      NotificationsMailer.email(@message).deliver
      redirect_to root_path
  end
end
