class Answer < ApplicationRecord
  belongs_to :question
  # Rails generator automatically adds a "belongs_to" statement in the model
  #  This will help us later work with associated records.
  belongs_to :user
  validates :body, length: {minimum: 2, maximum: 200}
end
