class Position < ActiveRecord::Base
	belongs_to :user

  attr_accessible :title, :user_id

	def self.all_titles
		%w(Paid_Driver Driver EMT Medic S/O Stand_Bys)
	end

end
