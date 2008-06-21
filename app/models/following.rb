class Following < ActiveRecord::Base
  fields do
    user_id :integer
    following_id :integer
    notify_on_add :boolean
    timestamps
  end

  belongs_to :user
  belongs_to :following,
    :class_name=>"User",
    :foreign_key=>"following_id"

end
