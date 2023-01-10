class CreateAlcoholTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :alcohol_types do |t|
      t.integer :name
      t.belongs_to :alcohol
      
      t.timestamps
    end
  end
end
