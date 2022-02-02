class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = Group.all
    @new_book = Book.new
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @new_book = Book.new
  end

  def new
    @group = Group.new
  end

  def create
    user = current_user
    @group = Group.new(group_params)
    @group.owner_id = user.id
    if @group.save
      @group.users << current_user
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def join
    group = Group.find(params[:id])
    GroupUser.create(group_id: group.id, user_id: current_user.id)
    redirect_to groups_path
  end

  def leave
    group = Group.find(params[:id])
    GroupUser.find_by(group_id: group.id, user_id: current_user.id).destroy
    redirect_to groups_path
  end


  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image_id)
  end
end
