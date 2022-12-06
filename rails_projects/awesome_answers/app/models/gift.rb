class Gift < ApplicationRecord
  belongs_to :answer

  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  validates :amount, numericality: {greater_than: 50}
end
