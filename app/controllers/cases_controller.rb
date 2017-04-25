require 'will_paginate/array'
class CasesController < ApplicationController
  before_action :authenticate_user!
  #before_action :admin_only, only: [:assign]
  before_action :find_case, only: [:edit, :update, :assign, :show, :reopen, :resolve] #change to an except

  # retrieve all cases from the database
  def index
    # retrieves all cases logged for the admin to see
    if current_user.is_admin?
      @cases = Case.includes(:user, :category).all.order('id ASC').page(params[:page]).per_page(10)
    end
    # retrieves cases for support staff
    if current_user.role == "support" && !current_user.is_admin?
      @cases = Case.where("assigned_to=?", current_user.id).paginate(page: params[:page], per_page: 10)
    end

    # retrieves cases that regular users have opened
    if current_user.regular?
      @cases = current_user.cases.paginate(page: params[:page], per_page: 10)
    end

  end

  def new
  	@case = Case.new
    @categories = ["General", "Miscellaneous"]
  end

  def create
  	@case = current_user.cases.new(case_params)
    @admin = User.where("is_admin=?",true).first
  	respond_to do |format|
		if @case.save
      Notification.create(actor: current_user, recipient: @admin, action: "Logged", notifiable: @case)
      CaseMailer.logged_case(@case).deliver_now
			format.html{redirect_to @case}
			format.json{render :show, status: :created, location: @case}
		else
			format.html{render :new}
			format.json{render json: @case.errors, status: :unprocessible_entity}
		end
	end
  end

  def edit
  end

  def update
			if @case.update_attributes(case_params)
        CaseMailer.reopen(@case).deliver_now if @case.open?
        CaseMailer.resolved(@case).deliver_now if @case.fixed?
        respond_to do |format|
          format.html{redirect_to @case}
          format.json{render :show, status: :created, location: @case}
        end
			else
				render 'edit'
			end
  end

  def show
    # @users will be passed into the form in the assign partial, and allows the admin or support staff reassign cases
    # to other users
    @users = User.where("role=?", "support").map{|user| [user.name, user.id]}
    if current_user.is_admin? 
      #render a partial that allows the admin assign tasks to any support staff
    end
    # Add an if - else block that renders different stuff based on the user's role
    # A regular user shouldn't be allowed to edit the resolution note
    # Add a form field for resolution note that can only be seen by support staff
  end

  #assign a case to a support staff
  def assign
    # raise params.inspect
    @case.update_attributes(assigned_to: params[:support_id])

    respond_to do |format|
      #format.js{}
      format.html {redirect_to @case}
    end
  end

  def find_by_category
    if params[:category_id]
      @category = Category.find_by_id(params[:category_id])
      @cases = @category.cases.order("created_at DESC").paginate(:page => params[:page], per_page: 10)
    end
  end

  # closes the case
  def close
    @case = Case.find(params[:id])
    @case.closed!
    CaseMailer.closed_case(@case).deliver_now
    respond_to do |format|
      #format.js{}
      format.html {redirect_to @case}
    end
    # add a mailer function
  end


  private
  def case_params
  	params.require(:case).permit(:description, :resolution_note, :status, :category_id) #use singular for the model name
  end

  #retrieve the case from the database and the user who created it
  def find_case
  	@case = Case.find_by_id(params[:id])
  end
end
