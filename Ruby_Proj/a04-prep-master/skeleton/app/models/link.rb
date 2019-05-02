class Link < ApplicationRecord
    validates :title, :url, presence: true
    validates :user_id, presence: {message: 'must exist can/t be blank'}

    belongs_to :user 
    has_many :comments
end