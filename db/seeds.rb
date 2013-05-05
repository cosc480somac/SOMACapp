# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@date = Time.now
@start_date = Date.new(@date.year, @date.month, @date.day) 
 
 Event.create(:name => 'Test time',:start_at => @start_date , :end_at => @start_date+1)
