class JobPost < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true, length: {minimum: 100}
    validates :min_salary, numericality: {greater_than: 30_000}
    validates :location, presence: true

    belongs_to :user
end
