class Poll < ApplicationRecord
    validates :title, presence:true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Poll
        
    has_many :questions,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Question

end