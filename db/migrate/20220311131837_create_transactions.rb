class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :transactions, id: :uuid, default: -> { 'public.gen_random_uuid()' } do |t|
      t.string :customer
      t.integer :output_amount
      t.integer :input_amount
      t.string :input_currency
      t.string :output_currency

      t.timestamps
    end
  end
end
