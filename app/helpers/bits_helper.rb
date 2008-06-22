module BitsHelper

  def bits_page_title
    if @page_title
      @page_title
    elsif logged_in?
      current_user == @user ? "My Bits" : @user.full_name + 's Bits'
    else
      'All Bits'
    end
  end
  
end
