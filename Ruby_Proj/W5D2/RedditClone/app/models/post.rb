class Post < ApplicationRecord

    validates :title, :user_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :PostSub,
        inverse_of: :post

    has_many :subs, 
        through: :post_subs,
        source: :sub

    has_many :comments

end