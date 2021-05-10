class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.text :tagline
      t.string :image
      t.integer :investment_goal, limit: 8
      t.integer :valuation, limit: 8

      t.timestamps
    end
  end
end
