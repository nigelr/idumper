class Following < ActiveRecord::Base
  fields do
    user_id :integer
    following_id :integer
    notify :boolean
    timestamps
  end


end
