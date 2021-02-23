FactoryBot.define do
  factory :url do
      token     { '12345678' }
      long_url  { 'asd/sdf/dfg' }
      counter   { 0 }
      # expired_at
      # created_at { Time.Now }
  end
end
