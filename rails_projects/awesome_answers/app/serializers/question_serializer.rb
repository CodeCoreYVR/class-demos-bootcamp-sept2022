class QuestionSerializer < ActiveModel::Serializer
  #Before rails sends JSON it will check to see if the model has a serializer with the same name.
  #If rails finds a serializer it will automatically serialize the instance into a JSON response

  #attributes method provided by active model seriallizer gem, defines what gets returned as JSON within the method
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/serializers.md
  attributes :id, :title, :body, :created_at, :updated_at, :view_count, :random_stuff, :like_count

  #====Custom attributes======>
  def random_stuff
    "You can add anyhting to your json response. This is an example."
  end

  def like_count
    #object refers to the instance of the model that is being serialized.  It's kind of like the "this" keyword in JS of "self" in Ruby classes
    object.likes.count
  end

  #======Associations=========>
  #to include associated models, we can use the same methods in Rails as we do for models like "has_many" or "belongs_to"
  has_many :answers

  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :author_full_name
    #customized method
    #rename user to author to make it more understandable for the person requesting data from our api
    def author_full_name
      object.user&.full_name
    end
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :full_name
  end

end
