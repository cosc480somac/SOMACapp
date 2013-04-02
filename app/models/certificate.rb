class Certificate < ActiveRecord::Base
	belongs_to :user
  attr_accessible :certificate, :expiration_date

end
