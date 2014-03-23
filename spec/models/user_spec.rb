require 'spec_helper'
require "cancan/matchers"

describe User do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "can manage own events" do
      let(:user){ FactoryGirl.create(:user) }

      it{ should be_able_to(:read, Event.new) }
      it{ should be_able_to(:create, Event.new) }
      it{ should be_able_to(:update, Event.new(:user => user)) }
      it{ should be_able_to(:destroy, Event.new(:user => user)) }
    end

    context "can not update,destory other events" do
    	 let(:user){ FactoryGirl.create(:user) }

    	 it{ should_not be_able_to(:update, Event.new) }
       it{ should_not be_able_to(:destroy, Event.new) }
  	end

  end
end
