class Author < ApplicationRecord
	has_many :books, dependent: :destroy

	validates_presence_of :first_name, :last_name

	accepts_nested_attributes_for :books

	scope :alphabetical, -> { order(last_name: :asc) }

	def full_name
		first_name + " " + last_name
	end

def reverse_name
	last_name + " " + first_name
end
end
