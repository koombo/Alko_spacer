class AlcoholType < ApplicationRecord
  belongs_to :alcohol, optional: true
  accepts_nested_attributes_for :alcohol

  enum name: { piwo: 0, wino: 1, wódka: 2, nalewka: 3 }
end
