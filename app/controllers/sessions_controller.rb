class SessionsController < ApplicationController
  def new
    session[:return_to] = request.referer
    if session[:return_to] == request.original_url
      redirect_to :controller => "articles", :action => "index"
    end 
  end
  
  def create
    session[:return_to] = request.referer
    if session[:return_to] == request.original_url
      redirect_to :controller => "articles", :action => "index"
    end
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to session[:return_to] 
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
end
