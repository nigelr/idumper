class Bit < ActiveRecord::Base
  fields do
    title :string
    content :text
    user_id :integer
    timestamps
  end
  
  acts_as_taggable
  
  belongs_to :user
  
  validates_presence_of :title
  
  def self.get_list(user)
    if user
      user.bits.find :all
    else
      find(:all, :order => 'id DESC', :limit => 10)
    end
  end
  
  def list_formatted_content
    self.content
  end
end
