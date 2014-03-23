# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  	user
  	name "test"
  	description "test test test"
  	start_time "2012-02-02 00:00:00"
  	end_time "2013-02-02 00:00:00"
  	location "Krakow"
  end
end
