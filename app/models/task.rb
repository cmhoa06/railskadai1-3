class Task < ApplicationRecord
    validates :content, 
        presence: true,
        length: { maximum: 20 }
    
    validates :start_at, 
        presence: true
    
    validates :end_at, 
        presence: true

    validate :start_end_check

    validates :memo, 
        length: { maximum: 500 }

        def start_end_check
            errors.add(:end_at, "の日付を正しく記入してください。") unless
            self.start_at.to_s < self.end_at.to_s
          end

end
