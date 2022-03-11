require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject(:transaction) { build(:transaction) }

    context 'with customer' do
      let(:error_message) { 'only allows 4 alphanumerics' }
      let(:attribute) { :customer }

      it_behaves_like 'a customer'
    end

    context 'with input_currency' do
      let(:attribute) { :input_currency }

      it_behaves_like 'a currency code'
    end

    context 'with output_currency' do
      let(:attribute) { :output_currency }

      it_behaves_like 'a currency code'
    end

    context 'with input_amount' do
      let(:attribute) { :input_amount }

      it_behaves_like 'an amount'
    end

    context 'with output_amount' do
      let(:attribute) { :output_amount }

      it_behaves_like 'an amount'
    end
  end
end