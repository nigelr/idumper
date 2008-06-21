class Bit < ActiveRecord::Base
  fields do
    title :string
    content :text
    user_id :integer
    timestamps
  end
  
  validates_presence_of :title
end
