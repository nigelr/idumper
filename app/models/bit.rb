class Bit < ActiveRecord::Base
  fields do
    title :string
    content :text
    timestamps
  end
end
