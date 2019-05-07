class Post < ApplicationRecord

    validates :title, :user_id, :sub_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :sub,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Sub

    has_many :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub 

    has_many :subs, 
    through: :post_subs,
    source: :sub

end