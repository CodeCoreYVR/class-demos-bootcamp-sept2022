class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at, :view_count, :random_stuff, :like_count

  #====Custom attributes======>
  def random_stuff
    "You can add anyhting to your json response. This is an example."
  end

  def like_count
    #object refers to the instance of the model that is being serialized.  It's kind of like the "this" keyword in JS of "self" in Ruby classes
    object.likes.count
  end
end
