FactoryBot.define do
  RANDOM_100_CHARS = "hello world hello world hello world hello world hello world hello world hello world hello hello worl hello world hello world"
  factory :job_post do
    sequence(:title) {|n| Faker::Job.title + " #{n}" }
    description { Faker::Job.field + "-#{RANDOM_100_CHARS}"}
    company_name {Faker::Company.name}
    min_salary {rand( 80_000..200_000)}
    max_salary { rand(200_000..400_000)}
    location {Faker::Address.city}
    association :user, factory: :user
  end

  #FactoryBot.create(:job_post) #will create and save the object to the db
  #FactoryBot.build(:job_post) #will create the object like .new and will not save it to the db
  #FactoryBot.attributes_for(:job_post) #Will generate a job post with only those specific attributes
end
