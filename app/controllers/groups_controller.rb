class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = Group.all
    @new_book = Book.new
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    user = current_user
    @group = Group.new(group_params)
    @group.owner_id = user.id
    if @group.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image_id)
  end
end
