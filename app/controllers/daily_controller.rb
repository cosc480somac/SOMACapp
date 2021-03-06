class DailyController < ApplicationController
	def index
	@date = Time.now
	@start_date = Date.new(@date.year, @date.month, @date.day)
	 
	@events = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date, @start_date+1])
        @events2 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+1, @start_date+2])
        @events3 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+2, @start_date+3])
        @events4 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+3, @start_date+4])
        @events5 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+4, @start_date+5])
        @events6 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+5, @start_date+6])
        @events7 = Event.find(:all, :conditions => ['start_at between ? and ?', @start_date+6, @start_date+7])
	end
	  def starts_at
          @event = Event.find(params[:id])
	  @event.start_at
    	end
end
