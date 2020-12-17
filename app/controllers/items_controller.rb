class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nicname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end
end
