class User < ActiveRecord::Base
  fields do
    first_name :string
    last_name :string
    email :string
    password :string
    login_enabled :boolean
  end

end
