class ToolCategoriesController < ApplicationController
  def new
    @tool_category = ToolCategory.new
  end

  def index
    @tool_category_list = ToolCategory.includes(:tool, :category).all
  end

  def new
    @tool_category = ToolCategory.new
  end

  def create
    @tool_category = ToolCategory.new(tool_category_params)

    if @tool_category.save
      redirect_to @tool_category
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def tool_category_params
    params.require(:tool_category).permit(:tool_id, :category_id)
  end
end
