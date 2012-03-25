require 'spec_helper'

module Newsie
  describe Event do
    let(:event) do
      mock_model Event, :name => "test_event",
      :start_date => Time.now(),
      :end_date => Time.now() + (60*60*24), # next day
      :content => "Random content",
    end
    let(:event) do
      mock_model Event, :name => "test_event2",
      :start_date => Time.now() - (60*60*24), #yesterday
      :end_date => Time.now() - 1, # one second ago
      :content => "Random content 2",
    end
    it { event.should be_valid }
    context "methods" do
      context "extra_extra" do
        it { extra_extra.should eq("Random content") }
      end
    end
  end
end
