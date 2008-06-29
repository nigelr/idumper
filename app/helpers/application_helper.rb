# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def show_login_details
    if logged_in?
      "#{ link_to 'Log out', logout_path }"
    else
      "#{ link_to 'Get your bits', login_path }"
    end
  end
  
  # greg, tag cloud helper
  def tag_cloud(tags, classes)
    max, min = 0, 0
    tags.each { |t|
      max = t.count.to_i if t.count.to_i > max
      min = t.count.to_i if t.count.to_i < min
    }
  
    divisor = ((max - min) / classes.size) + 1
  
    tags.each { |t|
      yield t.name, classes[(t.count.to_i - min) / divisor]
    }
  end
end
