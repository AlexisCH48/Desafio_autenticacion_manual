class User < ApplicationRecord
    include BCrypt
    validates :email, presence: true, uniqueness: { case_sensitive: false}
    validate :password_present?
    has_many :stories

    def password
        return nil unless password_digest.present?
        @password ||= Password.new(password_digest)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
    end

    def authenticate(unencrypted_password)
        password.is_password?(unencrypted_password) && self
    end

    def password_present?
        errors.add(:password, :blank) unless password.present?
    end
end
