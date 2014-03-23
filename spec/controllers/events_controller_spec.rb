require 'spec_helper'



describe EventsController do
  login_user
  
  let(:valid_attributes) { { :name=>'test', :description=> 'test', :start_time => '2010-01-01 00:00:00', :end_time => '2010-01-01 00:00:00' } }



  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, {}
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}
        response.should redirect_to(Event.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {:name => ''  }}
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {:name => ''  }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        event = FactoryGirl.create(:event, :user => subject.current_user)
        
        Event.any_instance.should_receive(:update).with({ "name" => "params" })
        put :update, {:id => event.to_param, :event => { "name" => "params" }}
      end

      it "assigns the requested event as @event" do
        event = FactoryGirl.create(:event, :user => subject.current_user)
        put :update, {:id => event.to_param, :event => valid_attributes}
        assigns(:event).should eq(event)
      end

      it "redirects to the event" do
        event = FactoryGirl.create(:event, :user => subject.current_user)
        put :update, {:id => event.to_param, :event => valid_attributes}
        response.should redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = FactoryGirl.create(:event, :user => subject.current_user)
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => {:name =>''  }}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = FactoryGirl.create(:event, :user => subject.current_user)
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => {:name =>''  }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = FactoryGirl.create(:event, :user => subject.current_user)
      #raise event.inspect
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = FactoryGirl.create(:event, :user => subject.current_user)
      delete :destroy, {:id => event.to_param}
      response.should redirect_to(events_url)
    end
  end

end
