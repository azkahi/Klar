class User < ApplicationRecord
	has_many :articles
	has_many :notifications
	has_many :messages
	before_save { self.email = email.downcase }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 4 }
end
