class Listing < ApplicationRecord
	has_many :investments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 2 }
	validates :tagline, presence: true, length: { minimum: 5 }
	validates :description, presence: true, length: { minimum: 5 }
	validates :image, presence: true
	validates :investment_goal, presence: true
	validates :valuation, presence: true
end
