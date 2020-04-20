class User < ApplicationRecord

    has_many :informations
    has_many :quizzes, through: :informations

    validates :username, :password,  presence: true
    validates_uniqueness_of :email

end
