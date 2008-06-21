# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def show_login_details
    if logged_in?
      "#{ current_user.full_name } | #{ link_to 'log out', logout_path }"
    end
  end
  
end
