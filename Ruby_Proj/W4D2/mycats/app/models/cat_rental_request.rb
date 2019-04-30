class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: ['PENDING', 'APPROVED', 'DENIED'] 
    validates :start_date, :end_date, presence: true
    # validate :overlapping_approved_requests

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlapping_requests
        CatRentalRequest
            .where.not(id: self.id)
            .where(cat_id: self.cat_id)
            .where.not('start_date > :end_date OR end_date < :start_date',
                        start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status=\'APPROVED\'')
    end

    def does_not_overlap_approved_request
        overlapping_approved_requests.empty?
    end

end