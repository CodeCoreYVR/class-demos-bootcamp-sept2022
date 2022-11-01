class User < ApplicationRecord

    has_secure_password
    #this is available to us because we uncommented bcrypt in the Gemfile
    #has_secure_password:
    #provide 2 attributes here: password, password_confirmation
    #add a validation for password field
    #provides us a method named "authentication"

    #======Associations========>
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy #you can use :nullify if you want the answer to still exist without a user

    has_many :job_posts, dependent: :destroy

    #======Custom Method=======>
    def full_name
        self.first_name + " " + self.last_name
    end

    #=====Validation===========>
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

end
