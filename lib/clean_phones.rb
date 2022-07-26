require 'csv'

def clean_phone_number(phone_number)
  return "" if phone_number.nil?
  phone_number = phone_number.delete "-" "\s" "." "(" ")" "+"

  if phone_number.length == 10
    phone_number
  elsif phone_number.length == 11 && phone_number[0] == '1'
    phone_number = phone_number[1..phone_number.length]
    phone_number
  else
    "0000000000"
  end
end

file = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

file.each do |row|
  phone_number = row[:homephone]
  p clean_phone_number(phone_number)
end
