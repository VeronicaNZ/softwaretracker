class ToolsController < ApplicationController
  def index
    #params = request.query_parameters
    if params.nil? or params[:q].nil?
      @tools = Tool.all
    else
      @tools = Tool.where("name LIKE ?","%" + params[:q] + "%" )
      @tools_with_users = Tool.where("name LIKE ?", "%" + params[:q] + "%").includes(:users, :categories)
      #Tool.left_outer_joins(:user_tools, :users).where("tools.name LIKE ?","%" + params[:q] + "%") #.references(:tool)
      #.find_by(user_id: params[:id])
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
    @tool = Tool.includes(:categories).find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to(@tool)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      #flash[:notice] = "New tool has been created."
      redirect_to @tool , notice: "New tool has been created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :description)
  end
end
