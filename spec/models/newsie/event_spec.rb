require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'models', 'newsie', 'event')

module Newsie
  describe Event do
    let(:event) { mock_model Event }
    it { event.should be_valid }
    context "methods" do
      context "extra_extra" do
        before(:all) { FactoryGirl.create(:event) }
        it "returns any event happening today" do 
          Event.extra_extra.length.should be > 0
        end
        it "does not return events not happening today" do
          @event.start_date = DateTime.current - 2.days
          @event.end_date = DateTime.current - 1.days
          @event.save!
          Event.extra_extra.should_not include(event)
        end
      end
      context "event_today?" do
        before(:all) { @event = FactoryGirl.create(:event) }
        it { Event.event_today?.should eq(true) }
        it "has no event today" do
          @event.start_date = DateTime.current - 2.days
          @event.end_date = DateTime.current - 1.days
          @event.save!
          Event.event_today?.should eq(false)
        end
      end
      context "just_in" do
        before(:all) do
          @event = FactoryGirl.create(:event)
          FactoryGirl.create(:event, :start_date => Time.now().to_date + 1.day, :end_date => Time.now().to_date + 2.days)
          FactoryGirl.create(:event, :start_date => Time.now().to_date + 1.day, :end_date => Time.now().to_date + 2.days)
        end
      end
    end
  end
end
