FactoryBot.define do
    factory :application do
      name { Faker::Name.name }
      
      job_id {1} 
    end
  end