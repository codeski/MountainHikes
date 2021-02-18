class User < ApplicationRecord
    has_many :links
    has_many :mountains, through: :links
    has_many :hikes
    has_many :mountains, through: :hikes

    has_secure_password
    validates :username, :email, presence: true
    validates :email, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
    end
end
