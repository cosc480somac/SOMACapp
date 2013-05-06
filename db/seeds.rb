# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@date = Time.now
arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
@start_time1 = DateTime.new(@date.year, @date.month, @date.day,0,0,0) 
@end_time1 = DateTime.new(@date.year, @date.month, @date.day, 8,0,0) 

@start_time2 = DateTime.new(@date.year, @date.month, @date.day,8,0,0) 
@end_time2 = DateTime.new(@date.year, @date.month, @date.day, 16,0,0) 

@start_time3 = DateTime.new(@date.year, @date.month, @date.day,16,0,0) 
@end_time3 = DateTime.new(@date.year, @date.month, @date.day, 23,59,59) 

@start_time4 = DateTime.new(@date.year, @date.month, @date.day,12,0,0) 
@end_time4 = DateTime.new(@date.year, @date.month, @date.day, 16,0,0) 

@start_time5 = DateTime.new(@date.year, @date.month, @date.day,16,0,0) 
@end_time5 = DateTime.new(@date.year, @date.month, @date.day, 20,0,0) 

for item in arr
 Event.create(:name => 'Paid Driver - Shift 1',:start_at => @start_time1+item , :end_at => @end_time1+item)
Event.create(:name => 'EMT - Shift 1',:start_at => @start_time1+item , :end_at => @end_time1+item)
Event.create(:name => 'Medic - Shift 1',:start_at => @start_time1+item , :end_at => @end_time1+item)

 Event.create(:name => 'Paid Driver - Shift 2',:start_at => @start_time2+item , :end_at => @end_time2+item)
Event.create(:name => 'EMT - Shift 2',:start_at => @start_time2+item , :end_at => @end_time2+item)
Event.create(:name => 'Medic - Shift 2',:start_at => @start_time2+item , :end_at => @end_time2+item)


 Event.create(:name => 'Paid Driver - Shift 3',:start_at => @start_time3+item , :end_at => @end_time3+item)
Event.create(:name => 'EMT - Shift 3',:start_at => @start_time3+item , :end_at => @end_time3+item)
Event.create(:name => 'Medic - Shift 3',:start_at => @start_time3+item , :end_at => @end_time3+item)



end
