FactoryBot.define do
    factory :job do
      position { Faker::Superhero.name }
      description { Faker::ProgrammingLanguage.name }
    end
  end