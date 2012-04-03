FactoryGirl.define do
  factory :event, :class => Newsie::Event do |e|
    e.sequence(:name) { |s| "Event #{s}" }
    e.sequence(:start_date) { |s| Time.now.to_datetime - 10.minutes } # Ten minutes earlier from Right now
    e.sequence(:end_date) { |s| Time.now.to_datetime + 1.days } # about a day from Right now
    e.sequence(:content) { |s| "Content #{s}" }
    e.dismiss false
  end
end
