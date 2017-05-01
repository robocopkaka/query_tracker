class UsersController < ApplicationController
	before_action :authenticate_user!, except:[:index]
	#before_action :admin_only, only: [:index]
	before_action :find_user, only: [:edit, :update, :show]

  def index
  	if user_signed_in?
      @cases = current_user.cases.page(params[:page]).per_page(10)
    end
  end

  def all
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	respond_to do |format|
  		if @user.save
  			format.html{redirect_to @user}
  			format.json{render :show, status: :created, location: @user}
  		else
  			format.html{render :new}
  			format.json{render json: @user.errors, status: :unprocessible_entity}
  		end
	 end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
  end

  def show
    @cases = @user.cases
    @open_cases = @user.cases.where("status=?", "open").count
    @resolved_cases = @user.cases.where("status=?", "closed").count
    @fixed_cases = @user.cases.where("status=?", "fixed").count
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone_number)
  end

  def find_user
  	@user = User.find_by_id(params[:id])
  end

  def admin_only
  	redirect_to :back if !current_user.is_admin?
  end
end
