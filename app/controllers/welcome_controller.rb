class WelcomeController < ApplicationController
  def index
    Octokit.configure do |c|
      c.login = ENV["github_username"] 
      c.password = ENV["github_pass"]
    end

    user = Octokit.user 'ackermanr'
    @events = user.rels[:events].get.data

  end

  def message
    @message = Message.new(params[:message])

      NotificationsMailer.email(@message).deliver
      redirect_to root_path
  end
end
