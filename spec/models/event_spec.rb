require 'spec_helper'

describe Event do
 	
 	it "has a valid factory" do
 	 	expect(FactoryGirl.create(:event)).to be_valid
 	end

 	[:name, :description, :start_time, :end_time].each do |attribute|
 		it "is invalid without a #{attribute}" do
 			event = FactoryGirl.build(:event, attribute => '')
 			event.should_not be_valid
 			event.errors.should have_key(attribute)
 		end
 	end



end
