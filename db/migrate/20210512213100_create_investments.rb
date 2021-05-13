class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.integer :amount
      t.references :listing, null: false, foreign_key: true
      t.references :investor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
