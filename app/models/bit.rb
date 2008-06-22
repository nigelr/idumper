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
  
  def self.get_list(user, current_user=nil)
    if user
      if current_user == user
        
      ids = [current_user.id] + current_user.users_being_followed_ids
      self.find :all, :conditions=>{:user_id=>ids}, :order=>:created_at
      else
      user.bits.find :all
      end
    else
      find(:all, :order => 'id DESC', :limit => 10)
    end
  end
    
  def list_formatted_content
    self.content.gsub("\n","<br>")
  end
  
  def self.tag_cloud
    Tag.all
  end

  def created_at_formatted
    self.created_at.to_s(:short)
  end
  
  def self.search value
    results = self.find(:all, :conditions=>["content like :search or title like :search", {:search=>"%#{value}%"}])
    return results, get_tags(results) 
  end
  
  def self.get_tags bits
    list = []
    bits.each do |bit|
      list << bit.tags
    end
    list.flatten.uniq
  end
    
end
