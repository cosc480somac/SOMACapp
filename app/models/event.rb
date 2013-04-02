class Event < ActiveRecord::Base
attr_accessible :end_at, :name, :start_at
has_event_calendar
  has_event_calendar
end
