class AlcoholReview < ApplicationRecord
  belongs_to :alcohol, optional: true
  accepts_nested_attributes_for :alcohol

  enum score: { bardzo_złe: 1, złe: 2, średnie: 3, dobre: 4, bardzo_dobre: 5 }
end
