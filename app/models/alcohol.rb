class Alcohol < ApplicationRecord
  has_one :alcohol_review
  has_one :alcohol_type
  accepts_nested_attributes_for :alcohol_review, :alcohol_type, :allow_destroy => true
  has_many_attached :images

end
