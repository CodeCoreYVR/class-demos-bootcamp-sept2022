FactoryBot.define do
  factory :gift do
    sender_id { 1 }
    receiver_id { 1 }
    amount { 1 }
    status { "MyString" }
    payment_id { "MyString" }
    answer { nil }
  end
end
