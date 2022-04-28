class Plan < ApplicationRecord
    belongs_to :user
    validate :plan_limitation
    validates_presence_of   :name,
                            :content,
                            :start_date,
                            :end_date,
                            :price,
                            :available
    validate :start_date_must_be_in_future
    validate :end_date_validation

    private
    def plan_limitation
        return if user.plans.count <=5
            errors.add(:base,'can not create more than 5 plans')
    end

    def start_date_must_be_in_future
        if start_date.present? && start_date.past?
            errors.add(:start_date, "can't be in the past")
        end
    end

    def end_date_validation
        if end_date < start_date
            errors.add(:end_date, 'must be after start date')
        end
    end
end
