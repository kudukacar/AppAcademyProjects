class Comment < ApplicationRecord
    validates :user_id, presence: {message: 'must exist can/t be blank'}
    validates :link_id, presence: {message: 'must exist can/t be blank'}
    validates :body, presence: true

    belongs_to :user 
    belongs_to :link

end