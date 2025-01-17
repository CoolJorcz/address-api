class Address < ApplicationRecord
  validates :line1, presence: true
  validates :city, presence: true
  validates :state, length: { is: 2 }, presence: true
  validates :zip, presence: true
  validates_format_of :zip, with: /\d{5}(?:[-\s]\d{4})?/

  include PgSearch::Model
  pg_search_scope :search_by_full_address, against: [:line1, :line2, :city, :state, :zip]
end
