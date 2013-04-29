class Event < ActiveRecord::Base

	has_and_belongs_to_many :users, :uniq => true
	attr_accessible :end_at, :name, :start_at
	has_event_calendar

	def starts_at
	  start_at
	end

	def ends_at
	   end_at
	end

end
