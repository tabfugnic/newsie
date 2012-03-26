Factory.define :event do |e|
  e.sequence(:name) { |s| "Event #{s}" }
  e.sequence(:start_date) { |s| DateTime.current + s.days }
  e.sequence(:end_date) { |s| DateTime.current + (1 + s).days.ago }
  e.sequence(:content) { |s| "Content #{s}" }
  e.dismiss false
end
