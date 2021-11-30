class FixedCostsController < ApplicationController
    before_action :set_fixed_cost, only: [:update, :show, :destroy]

    def index
        @fixed_costs = FixedCost.includes(:category, :payment_method).where(user_id: params[:user_id]).order(:scheduled_date)
        render json: @fixed_costs.as_json(include: [:category, :payment_method]), status: 200
    end
    
    def create
        fixed_cost = FixedCost.new(fixed_cost_params)
        if fixed_cost.save!
            render json: fixed_cost, status: 201
        else
            render json: fixed_cost.errors, status: 401
        end
    end

    def show
        return render json: @fixed_cost, status: 200 if @fixed_cost
        render json: {errors: "ログインしてください。"}, status: 400
    end
    
    def update
        if @fixed_cost.update!(fixed_cost_params)
            render json: @fixed_cost, status: 202
        else
            render json: @fixed_cost.errors, status: 401
        end
    end

    def destroy
        if @fixed_cost.destroy
            head :no_content
        else
            render json: @fixed_cost.errors, status: 401
        end
    end

    private
    
    def set_fixed_cost
        @fixed_cost = FixedCost.find(params[:id])
    end
    
    def fixed_cost_params
        params.require(:fixed_cost).permit(:name, :price, :scheduled_date, :note, :category_id, :payment_method_id, :user_id)
    end
end
