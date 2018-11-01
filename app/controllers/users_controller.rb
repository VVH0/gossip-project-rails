class UsersController < ApplicationController
  def index
    @user = User.all
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to gossip_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def login

  end

  def check
    @user = User.where(email:params[:email], password:params[:password]).first
    puts @user
    if @user
      flash[:info] = "Vous êtes bien connecté #{@user.first_name} !"
      redirect_to "/users/home"
    else
      flash[:info] = "Échec "
      redirect_to "/users/login"
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :email, :last_name, :age, :password)
    end
end
