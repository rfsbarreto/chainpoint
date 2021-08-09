FactoryBot.define do
  factory :badge do
    issue_date { Date.today }
    recipient_name { 'recipient' }
    badge_uuid { Faker::String.random }
  end
end
