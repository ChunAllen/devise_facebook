class Relationship < ActiveRecord::Base
  attr_accessible :friend_id, :status, :user_id
end
