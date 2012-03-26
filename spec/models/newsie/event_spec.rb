require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'models', 'newsie', 'event')

module Newsie
  describe Event do
    let(:event) { mock_model Event }
    it { event.should be_valid }
    context "methods" do
      context "extra_extra" do
        before(:each) { FactoryGirl.create(:event) }
        it "returns any event happening today" do 
          Event.extra_extra.length.should be > 0
        end
        it "returns no events" do
          FactoryGirl.create(:event, :start_date => DateTime.current - 2.days, :end_date => DateTime.current - 1.day)
          Event.extra_extra.should be_empty()
        end
      end
      context "event_today" do
        before(:each) { FactoryGirl.build(:event) }
        it { Event.event_today?.should eq(true) }
        it "has no event today" do
          Event.event_today?.should eq(false)
        end
      end
    end
  end
end
