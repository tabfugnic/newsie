require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'models', 'newsie', 'event')

module Newsie
  describe Event do
    before :all do
      5.times do |i|
        Newsie::Event.create!( {
                                 :name	     => "Event #{i}",
                                 :start_date => Time.now() + (60*60*24*(i-1)), #Start with day before
                                 :end_dated  => Time.now() + (60*60*24*i),     #Start with current current day
                                 :content    => "Content #{i}"
                               } )
      end
    end
    let(:event) do
      mock_model Event, :name => "test_event",
      :start_date => Time.now(),
      :end_date => Time.now() + (60*60*24), # next day
      :content => "Random content",
    end
    it { event.should be_valid }
    context "methods" do
      context "extra_extra" do
        it { Event.extra_extra.should eq("Content 0") }
      end
    end
  end
end
