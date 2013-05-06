class Role < ActiveRecord::Base
	has_and_belongs_to_many :user

        attr_accessible :title, :user_id

end
