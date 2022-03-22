class TransactionsController < ApplicationController
  before_action :transactions_params, only: :create

	def create
      @transaction = Transaction.new(transactions_params)
      if @transaction.save
       render json: @transaction.to_json
      else
       render json: @transaction.error, status: :not_accessible
      end	
	end

	def index
	  @transactions = Transaction.all		
	  render json: @transactions.to_json
	end

	def show
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.present?
      render json: @transaction.to_json
    else
      render plain: "Transaction Not Found", status: 404
    end
	end

	private

	def transactions_params
	  params.require(:transaction).permit(:input_amount, :output_amount, :output_currency, :input_currency, :customer_id)	
	end

	def transaction_owner
	  @transaction = Transaction.find(params[:id])
	  redirect_to transactions_path unless current_user == current_customer
	end
end
