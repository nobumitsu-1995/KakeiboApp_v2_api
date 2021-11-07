class PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: [:update, :destroy]

  def index
    @default_payment_methods = PaymentMethod.where(user_id: nil)
    @custum_payment_methods = PaymentMethod.where(user: current_user)
    render json: {default: @default_payment_methods, custum: @custum_payment_methods}, status: 200
  end

  def show
    @payment_method = PaymentMethod.find(params[:id])
    render json: @payment_method, status: 200
  end

  def create
    payment_method = current_user.payment_methods.build(payment_method_params)
    if payment_method.save!
        render json: payment_method, status: 201
    else
        render json: payment_method.errors, status: 401
    end 
  end

  def update
    if @payment_method.update!(payment_method_params)
      render json: @payment_method, status: 202
    else
      render json: @payment_method.errors, status: 401
    end
  end

  def destroy
    if @payment_method.destroy!
      head :no_content
    else
      render json: @payment_method.errors, status: 401
    end
  end

  private

    def set_payment_method
        @payment_method = current_user.payment_methods.find(params[:id])
    end

    def payment_method_params
        params.require(:payment_method).permit(:name, :income)
    end
end
