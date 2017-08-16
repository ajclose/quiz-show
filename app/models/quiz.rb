class Quiz < ApplicationRecord
  has_many :questions
  has_many :completed_quizzes
  validates :title, presence: true
  validates :description, presence: true

  scope :published, -> { where(published: true)}
  scope :unpublished, -> { where(published: false)}
end
