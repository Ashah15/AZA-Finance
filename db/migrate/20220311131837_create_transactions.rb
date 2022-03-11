class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :customer
      t.integer :output_amount
      t.integer :input_amount
      t.string :input_currency
      t.string :output_currency

      t.timestamps
    end
  end
end
