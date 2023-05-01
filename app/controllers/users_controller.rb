class UsersController < ApplicationController
  def index
    if params.nil? or params[:q].nil?
      @users = User.all
    else
      @users = User.all #.where("first_name like ?", "%"+params[:q]+"%")
      @users_with_tools = User.where("first_name LIKE ?", "%" + params[:q] + "%").includes(:tools)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.includes(:tools).find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: :see_other, notice: 'User successfully deleted!'
  end

  def search
    @users_with_tools = User.where("name like ?", "%"+params[:q]+"%")
    redirect_to @users_with_tools
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def save_user_tool
    @user_tool = UserTool.new(user_tool_params)
    @user_tool.save
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :sur_name)
  end
end
