class Quizz < ApplicationRecord
    has_many :informations
    has_many :users, through: :informations

    validates :title,  presence: true
end
