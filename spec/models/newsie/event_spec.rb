require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'models', 'newsie', 'event')

module Newsie
  describe Event do
    let(:event) { mock_model Event }
    it { event.should be_valid }
    context "methods" do
      context "extra_extra" do
        it { Event.extra_extra.should eq("Content 0") }
      end
      context "event_today" do
        it { Event.event_today?.should eq(true) }
        it "has no event today" do
          Event.all.each do |e|
            e.start_date = Time.now() - (60*60*24*2) #two day ago
            e.end_date = Time.now()  - (60*60*24) #one day ago
          end
          Event.event_today?.should eq(false)
        end
      end
    end
  end
end
