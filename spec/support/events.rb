FactoryGirl.define do
  factory :event, :class => Newsie::Event do |e|
    e.sequence(:name) { |s| "Event #{s}" }
    e.sequence(:start_date) { |s| DateTime.current - s.days }
    e.sequence(:end_date) { |s| DateTime.current + (s + 1).days }
    e.sequence(:content) { |s| "Content #{s}" }
    e.dismiss false
  end
end
