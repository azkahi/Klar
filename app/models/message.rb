class Message < ApplicationRecord
	belongs_to :user
	validates :content, presence: true
	validates :title, presence: true
	validates :subject, presence: true
end
