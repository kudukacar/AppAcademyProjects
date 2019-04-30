class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper 
    VALID_COLORS = ['brown', 'gray', 'orange']
    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: VALID_COLORS
    validates :sex, inclusion:  ['M', 'F']


    has_many :cat_rental_requests, dependent: :destroy
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

    def age
        time_ago_in_words(birth_date)
    end

end