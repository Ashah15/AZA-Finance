class TransactionsController < ApplicationController
  before_action :transaction_params, only: :create
  before_action :find_transaction, only: :show

	def create
      @transaction = Transaction.new(transactions_params)
      if @transaction.save
       render json: @transaction.to_json
      else
       render json: @transaction.error, status: :not_accessible
      end	
	end

	def index
	  @transaction = Transaction.all		
	end

	def show
    @transaction = Transaction.find(params[:id])
	end

	private

	def transactions_params
	  params.require(:transaction).permit(:input_amount, :output_amount, :output_currency, :input_currency, :customer)	
	end

	def transaction_owner
	  @transaction = Transaction.find(params[:id])
	  redirect_to transactions_path unless current_user == current_customer
	end
end
