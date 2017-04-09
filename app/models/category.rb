class Category < ApplicationRecord
	has_many :cases
	validates :name, presence: true, uniqueness: true
end
