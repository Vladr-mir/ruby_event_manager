require 'time'
require 'date'
require 'csv'

def time_hour(dt)
  time = DateTime.strptime(dt, '%m/%d/%Y %H:%M')
  time.hour
end

def time_weekday(dt)
  time = DateTime.strptime(dt, '%m/%d/%Y %H:%M')
  time.wday
end

file = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

time_alls = 0
day_alls = 0
lines = 1

file.each do |row|
  time = row[:regdate]
  time_alls += time_hour(time)
  day_alls += time_weekday(time) + 1
  lines += 1
end

puts "The best hours are: #{time_alls / lines}:00"
puts "The best day is: #{Date::DAYNAMES[day_alls / lines]}"
