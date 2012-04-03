require 'spec_helper'
module Newsie
  describe EventsController do
    # Potential Ajax call
    before(:each) { @event = FactoryGirl.create(:event) }
    context "recent" do
      it "returns the most recent single event without going into the future" do
        FactoryGirl.create(:event, :start_date => Time.now.to_date - 5.days, :end_date => Time.now.to_date - 3.days)
        FactoryGirl.create(:event, :start_date => Time.now.to_date + 5.days, :end_date => Time.now.to_date - + 7.days)
        get :recent
        response.should eq(@event)
      end
    end
  end
end
