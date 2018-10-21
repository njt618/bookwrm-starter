FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyText" }
    isbn { "MyString" }
    genre { "MyString" }
    publish_date { "2018-10-21" }
    num_page { "" }
    image_url { "MyString" }
    author { nil }
  end
end
