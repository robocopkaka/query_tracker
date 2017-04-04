class CasesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [:assign]
  before_action :find_case, only: [:edit, :update, :assign, :show]

  # retrieve all cases from the database
  def index
    @cases = Case.all
  end

  def new
  	@case = Case.new
  end

  def create
  	@case = current_user.cases.new(case_params)
  	respond_to do |format|
		if @case.save
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
  	respond_to do |format|
			if @case.update_attributes(case_params)
				redirect_to @case
			else
				render 'edit'
			end
	end
  end

  def show
    if current_user.is_admin?
      #render a partial that allows the admin assign tasks to any support staff
    end
    # Add an if - else block that renders different stuff based on the user's role
    # A regular user shouldn't be allowed to edit the resolution note
    # Add a form field for resolution note that can only be seen by support staff
  end

  #assign a case to a support staff
  def assign
    @case.update_attributes()
  end

  private
  def case_params
  	params.require(:case).permit(:description, :resolution_note) #use singular for the model name
  end

  #retrieve the case from the database and the user who created it
  def find_case
  	@case = Case.find_by_id(params[:id])
  end
end
