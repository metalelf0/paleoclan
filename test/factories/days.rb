# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :day do
    sequence(:date) do |n|
      next_workday(Date.today + n)
    end
  end
end
