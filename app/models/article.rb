class Article < ApplicationRecord
  belongs_to :BOK_id
  belongs_to :user_id
  has_many :comments
end
