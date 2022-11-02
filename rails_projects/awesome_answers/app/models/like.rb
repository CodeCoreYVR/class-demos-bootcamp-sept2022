class Like < ApplicationRecord
    #To create this model after already creating a migration for the likes join table, run:
    # rails g model like --skip

    #Associations
    belongs_to :user
    belongs_to :question

    #Validations

    validates(
        :question_id,
        uniqueness: {
            scope: :user_id,
            message: "Has already been liked"
        }
    )

    #If we did not have the scope, then this valiodation would have limited a question to only be liked once
    #but now the questions can be liked multiple times, but only once by a particular user


end
