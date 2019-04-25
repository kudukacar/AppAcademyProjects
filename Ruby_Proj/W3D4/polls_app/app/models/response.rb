class Response < ApplicationRecord 
    validates :question_id, :answer_id, presence:true

    belongs_to :answer_choice, 
        primary_key: :id, 
        foreign_key: :answer_id, 
        class_name: :AnswerChoice 

    belongs_to :respondent,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :Response 

end