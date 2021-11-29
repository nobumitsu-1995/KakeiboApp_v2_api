class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy, :show]

  def index
    @categories = Category.where(user_id: [params[:user_id], nil])
    render json: @categories, status: 200
  end

  def show
    render json: @category, status: 200
  end

  def create
    category = Category.new(category_params)
    if category.save!
        render json: category, status: 201
    else
        render json: category.errors,status: 401
    end
  end

  def update
    if @category.update!(category_params)
      render json: @category, status: 202
    else
      render json: @category.errors, status: 401
    end
  end

  def destroy
    if @category.destroy!
      head :no_content
    else
        render json: @category.errors, status: 401
    end
  end

  private

    def set_category
        @category = Category.find(params[:id])
    end
    
    def category_params
        params.require(:category).permit(:name, :big_category, :user_id)
    end

end
