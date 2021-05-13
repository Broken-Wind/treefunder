class Investor < ApplicationRecord
	has_many :investments, dependent: :destroy
end
