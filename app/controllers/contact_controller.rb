class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def index
  end
 
end
