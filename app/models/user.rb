class User < ApplicationRecord
 
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    has_many :plans, dependent: :destroy
    validates :name, :birthday, presence: true
    validates :email,
                presence: true,
                uniqueness: { case_sensitive: false },
                format: { with: EMAIL_REGEX }
end
