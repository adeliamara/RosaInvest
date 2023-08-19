class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :status
      t.string :destination
      t.integer :profitabily_rate
      t.integer :minimum_period_for_realization
      t.float :administration_fee
      t.date :due_date

      t.timestamps
    end
  end
end
