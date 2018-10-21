FactoryBot.define do
  factory :review do
    comment { "MyText" }
    rating { 1 }
    book { nil }
    user { nil }
  end
end
