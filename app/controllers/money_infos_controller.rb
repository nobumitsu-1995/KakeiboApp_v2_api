class MoneyInfosController < ApplicationController
    before_action :set_money_info, only: [:show, :update]

    def show
        render json: @money_info, status: 200
    end
    
    def create
        money_info = MoneyInfo.create(money_info_params)
        if money_info.save!
            render json: money_info, status: 201
        else
            render json: money_info.errors, status: 401
        end
    end
    
    def update
        if @money_info.update!(money_info_params)
            render json: @money_info, status: 202
        else
            render json: @money_info.errors, status: 401
        end
    end
    
    private

    def set_money_info
        @money_info = MoneyInfo.find_by((user_id: params[:user_id]))
    end

    def money_info_params
        params.require(:money_info).permit(:total_assets, :target_amount, :deadline, :user_id)
    end
end
