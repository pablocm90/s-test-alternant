class Question < ApplicationRecord
    belongs_to :quizz, required:true
end
