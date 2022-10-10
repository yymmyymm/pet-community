class Public::GroupsController < ApplicationController
  before_action :authenticate_customer!


  def new
    @group =Group.new
  end

  def index
    @post_image = PostImage.new
    @groups = Group.all
  end

  def show
    @post_image = PostImage.new
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end


end
