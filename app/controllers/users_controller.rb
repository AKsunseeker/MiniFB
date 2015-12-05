class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_path
     else
      redirect_to user_path(user)       
    end     
  end





# def destroy
#     list = List.find(params[:id])
#     if list.destroy
#       redirect_to lists_path
#     else
#       redirect_to lists_path(list)
#     end
#   end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :age)
    end






end
