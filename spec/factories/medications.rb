FactoryGirl.define do
  factory :medication do
    medication_name {Faker::Name.name}
    stock_quantity 10
    expiry_date "31/12/2013"
  end
end

