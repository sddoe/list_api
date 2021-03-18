class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])


    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User created successfully'
    else
      redirect_to new_user_path, alert: 'User creation failed'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice 'User updated successfully'
    else
      redirect_to edit_user_path, alert 'User update failed'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, notice 'User deleted'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :birth_date, :gender, :image_url)
    end
end
