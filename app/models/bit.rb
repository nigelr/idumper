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
  
end
