class HomeController < ApplicationController
  
  def index
    @tags = Bit.tag_cloud
  end

end
