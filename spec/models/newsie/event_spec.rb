require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'models', 'newsie', 'event')

module Newsie
  describe Event do
    let(:event) { mock_model Event }
    it { event.should be_valid }
    context "class methods" do

      context "find" do
        before(:each) { @event = FactoryGirl.create(:event, :name => "your_event") }
        it { Event.find("your_event").should eq(@event) }
        it { Event.find(@event.id).should eq(@event) }
        # before(:each) { 3.times { |t| @event = FactoryGirl.create(:event, :name => "your_event") } }
        # it { Event.find("your_event").length.should eq(3) }
        # it { Event.find(@event.id).should eq([@event]) }
      end 
      context "now" do
        before(:each) { @event = FactoryGirl.create(:event) }
        it "returns events happening right now" do 
          Event.now.length.should be > 0
        end
        it "does not have any events to return right now" do
          @event.start_date = Time.now.to_datetime - 2.days
          @event.end_date = Time.now.to_datetime - 1.days
          @event.save!
          Event.now.should_not include(@event)
        end
      end

      context "now?" do
        before(:each) { @event = FactoryGirl.create(:event) }
        it { Event.now?.should eq(true) }
        it "has no event today" do
          @event.start_date = Time.now.to_datetime - 2.days
          @event.end_date = Time.now.to_datetime - 1.days
          @event.save!
          Event.now?.should eq(false)
        end
      end

      context "recently_added" do
        before(:each) do
          FactoryGirl.create(:event)
          @event = FactoryGirl.create(:event)
        end
        it { Event.recently_added.should eq(@event) }
      end

      context "most_current" do
        before(:each) do
          @event = FactoryGirl.create(:event)
          FactoryGirl.create(:event, :start_date => Time.now.to_datetime + 1.day, :end_date => Time.now.to_datetime + 2.days)
          FactoryGirl.create(:event, :start_date => Time.now.to_datetime - 2.day, :end_date => Time.now.to_datetime + 2.days)
        end
        it { Event.most_current.should eq(@event) }
      end
    end
    context "instance variables" do
      context "now?" do
        before(:each) { @event = FactoryGirl.create(:event, :start_date => Time.now.to_datetime - 1.day, :end_date => Time.now.to_datetime + 1.day) }
        it { @event.now?.should be(true) }
      end
      context "content" do
        before(:each) { @event = FactoryGirl.create(:event) }
        it "stores hash as json object" do
          thash = {:some_object => "content", :no_way => "lucky"}
          @event.content = thash
          @event.attributes["content"].should eq(thash.to_json)
        end
        it "stores strings as strings" do
          tstring = "lucky"
          @event.content = tstring
          @event.attributes["content"].should eq(tstring)
        end
        it "returns content as hash" do
          thash = {:some_object => "content", :no_way => "lucky"}
          @event.attributes["content"] = thash.to_json
          @event.content.should eq(thash)
        end
        it "returns content as string" do
          tstring = "lucky"
          @event.attributes["content"] = tstring
          @event.content = tstring
        end
      end
    end
  end
end
