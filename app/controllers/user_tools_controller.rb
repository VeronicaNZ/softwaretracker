class UserToolsController < ApplicationController
  def index
    if params.nil? or params[:q].nil?
      @user_tool_list = UserTool.includes(:user, :tool).all
    else
      @user_tool_list = UserTool.includes(:user, :tool, :tool_categories, :categories).joins(:user)
                                .where("users.first_name LIKE ? or users.sur_name LIKE ? ", "%" + params[:q] + "%","%" + params[:q] + "%")
    end
  end

  def show
    @user_tool = UserTool.includes(:user, :tool).find_by(user_id: params[:id])
  end

  def new
    @user_tool = UserTool.new
  end

  def create
    @user_tool = UserTool.new(user_tool_params)

    if @user_tool.save
      redirect_to @user_tool
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_tool_params
    params.require(:user_tool).permit(:user_id, :tool_id)
  end
end
