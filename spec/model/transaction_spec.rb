require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject{ described_class.new(customer_id: "1",
                               input_amount: 3,
                               output_amount: 4,
                               input_currency: 5,
                               output_currency: 6)
  }  

    it 'checks that a transaction can be created' do
      expect(subject).to be_valid
    end

    it 'shows that a transaction has been created' do
      expect(subject).to be_valid
    end

    it "is valid with input_amount" do
      expect(subject).to be_valid
    end

    it "is valid with output_amount" do
      expect(subject).to be_valid
    end

    it "is not valid without a customer_id" do
    subject.customer_id = nil
    expect(subject).to_not be_valid
    end

    it "is not valid without an input_amount" do
    subject.input_amount = nil
    expect(subject).to_not be_valid
    end

    it "is not valid without an output_amount" do
    subject.output_amount = nil
    expect(subject).to_not be_valid
    end

    it "is valid with input_currency" do
    expect(subject).to be_valid
    end

    it "is valid with output_currency" do
    expect(subject).to be_valid
    end
end