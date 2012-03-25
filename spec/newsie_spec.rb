require 'spec_helper'

describe Newsie do
  it "should be valid" do
    Newsie.should be_a(Module)
  end
  it "setup block yields self" do
    Newsie.setup do |config|
      Newsie.should eq(config)
    end
  end
end
