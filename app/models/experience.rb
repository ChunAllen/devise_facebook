class Experience < ActiveRecord::Base
  attr_accessible :company, :description, :from_month, :from_year, :location, :title, :to_month,  :to_year, :user_id

  belongs_to :user
end
