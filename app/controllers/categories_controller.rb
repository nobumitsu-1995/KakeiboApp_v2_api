class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  def index
    @custum_categories = Category.where(user: current_user)
    @default_categories = Category.where(user_id: nil)
    render json: {default: @default_categories, custum: @custum_categories}, status: 200
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: 200
  end

  def create
    category = current_user.categories.build(category_params)
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
        @category = current_user.categories.find(params[:id])
    end
    
    def category_params
        params.require(:category).permit(:name, :big_category)
    end

end
