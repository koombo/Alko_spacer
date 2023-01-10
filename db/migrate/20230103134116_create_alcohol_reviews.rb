class CreateAlcoholReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :alcohol_reviews do |t|
      t.integer :score
      t.belongs_to :alcohol
      
      t.timestamps
    end
  end
end
