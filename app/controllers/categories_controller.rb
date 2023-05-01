class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    if params.nil? or params[:q].nil?
      @categories = Category.all
    else
      @categories = Category.where("name LIKE ?","%" + params[:q] + "%" )
    end
  end

  def show
    @tool = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
