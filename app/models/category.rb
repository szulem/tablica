class Category < ApplicationRecord
	has_many :ads
	has_many :subcategories
end
