class Tagging < ApplicationRecord
  belongs_to :question
  belongs_to :tag

  #Each tag can only be applied to a specific question once
  validates :tag_id, uniqueness: { scope: :question_id }
end
