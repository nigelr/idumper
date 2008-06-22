# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def show_login_details
    if logged_in?
      "#{ link_to 'Log out', logout_path }"
    else
      "#{ link_to 'Get your bits', login_path }"
    end
  end
  
end
