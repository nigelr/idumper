# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def show_login_details
    if logged_in?
      "Logged in as: #{ current_user.full_name } | #{ link_to 'log out', logout_path }"
    else
      "#{ link_to 'get your bits!', login_path }"
    end
  end
  
end
