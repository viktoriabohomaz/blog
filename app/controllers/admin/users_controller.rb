# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    helper UserHelper
    before_action :authenticate_user!

    def index
      @users = User.all
      authorize @users
    end

    def new
      @user = User.new
      authorize @user
    end

    def create
      @user = User.new(user_params)
      authorize @user
      if @user.save
        redirect_to admin_users_path, notice: 'Copywriter was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @user = User.find(params[:id])
      authorize @user
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
