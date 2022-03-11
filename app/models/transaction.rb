class Transaction < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates_presence_of :input_amount, :customer_id, :input_currency, :output_currency, :output_amount


  validates :input_amount, :output_amount, format: { with: /\A\d+\z/, message: "Integer only." }

  validates :customer, format: { with: FX::Regex::Transaction.customer_regex,
                                 message: 'only allows 4 alphanumerics' }

end
