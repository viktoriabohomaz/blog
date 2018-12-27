class UsersController < ApplicationController
	#protect_from_forgery with: :exeptions

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
    @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to dashboards_manage_users_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:title, :description, :image)
    end
end
