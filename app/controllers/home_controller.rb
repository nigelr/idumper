class HomeController < ApplicationController
  
  def index
    @tags = Bit.tag_cloud
    @user = current_user
  end

end
