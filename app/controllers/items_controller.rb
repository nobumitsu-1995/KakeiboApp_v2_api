class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :show, :destroy]

  def index
      @month = Date.parse(params[:month])
      @items = Item.includes(:category, :payment_method).where(user_id: session[:user_id], date: @month.all_month).order(:date)
      render json: @items.as_json(include: [:category, :payment_method]), status: 200
  end
  
  def create
      item = current_user.items.new(item_params)
      if item.save!
          render json: item, status: 201
      else
          render json: item.errors.full_messages, status: 401
      end
  end

  def show
      return render json: @item, status: 200 if @item
      render json: {errors: "ログインしてください。"}, status: 400
  end
  
  def update
      if @item.update!(item_params)
          render json: @item, status: 202
      else
          render json: @item.errors, status: 401
      end
  end

  def destroy
      if @item.destroy
          head :no_content
      else
          render json: @item.errors, status: 401
      end
  end

  private
  
  def set_item
      @item = current_user.items.find(params[:id])
  end
  
  def item_params
      params.require(:item).permit(:name, :price, :date, :note, :category_id, :payment_method_id)
  end
end
