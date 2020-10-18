class Address < ApplicationRecord
  validates :state, length: { is: 2 }
  validates_format_of :zip, with: /\d{5}(?:[-\s]\d{4})?/
end
