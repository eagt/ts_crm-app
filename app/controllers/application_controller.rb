class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




# The code below is used to be able to set the translation 
#to other languages options

def default_url_options(options = {})
  	{ locale: I18n.locale }.merge options
end


private


  def confirm_logged_in
      unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
    else
      return true
    end    
  end

end