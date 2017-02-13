class Question < ApplicationRecord
  belongs_to :user

  validates :title, :question, presence: true
end
