module BitsHelper

  def bits_page_title
    if @page_title
      @page_title
    elsif logged_in?
      current_user == @user ? "My Bits" : @user.full_name.capitalize + "'s Bits <h2>(Go #{@user.full_name.capitalize}!)</h2>"
    else
      'All Bits'
    end
  end
  
end
