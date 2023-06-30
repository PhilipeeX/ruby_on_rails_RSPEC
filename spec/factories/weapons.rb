FactoryBot.define do
  factory :weapon do
    weaponname { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    power_base { FFaker::Random.rand(3000..16000) }
    power_step { FFaker::Random.rand(100..200) }
    level { FFaker::Random.rand(1..99) }
  end
end
