FactoryGirl.define do
  factory :city_map do |f|
    f.city_id { build(:city) }
    f.origin  'A'
    f.destiny 'B'
    f.distance 10
  end
end
