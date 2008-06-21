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
      r=user.bits.find :all
    elsif
      r=self.find(:all, :order => ' id DESC', :limit => 10)
    end
    return r
  end
  
end
