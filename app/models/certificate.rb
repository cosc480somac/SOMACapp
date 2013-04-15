class Certificate < ActiveRecord::Base
	belongs_to :user

  attr_accessible :expiration_date, :name, :user_id
end
