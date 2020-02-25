class Micropost < ApplicationRecord
  belongs_to :user
  validates :content ,length: { :minimum => 10 },presence: true
end
