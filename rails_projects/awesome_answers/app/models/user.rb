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

    #To create join table associations without Like model:
    # has_and_belongs_to_many(
    #     :liked_questions, #this is the name/alias we want to give it
        
    #         class_name: 'Question', #this is the name of the model we are associating with
    #         join_table: 'likes', #this is the name of the join table
    #         association_foreign_key: 'question_id', #this is the name of the key that will act as the foreign key
    #         foreign_key: 'user_id' #this is the name of the key that will be used as the foreign key in the join
    #         #table of this table
        
    # )

    #To create association with Like model through decompomposing:
    has_many :likes, dependent: :destroy
    #the questions liked by the user:
    has_many :liked_questions, through: :likes, source: :question

    #======Custom Method=======>
    def full_name
        self.first_name + " " + self.last_name
    end

    #=====Validation===========>
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

end
