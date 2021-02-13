class User < ApplicationRecord
    has_many :hikes
    has_many :mountains, through: :hikes

    has_secure_password
    validates :name, :email, presence: true
    validates :email, uniqueness: true

end
