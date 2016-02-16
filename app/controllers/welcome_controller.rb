class WelcomeController < ApplicationController
  
layout "welcome"

def default_url_options(options = {})
    { locale: I18n.locale }.merge options
end


  def index
  end

  def create
  end

  def new
  end

  def show
    
  end

  def delete
  end

  def destroy
  end
end
