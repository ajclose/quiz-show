class Quiz < ApplicationRecord
  has_many :questions
  has_many :completed_quizzes
  validates :title, presence: true
  validates :description, presence: true
end
