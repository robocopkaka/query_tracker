class CasesController < ApplicationController
  before_action :authenticate_user
  before_action :admin_only, only: [:assign]
  before_action :find_case, only: [:edit, :update, :assign]
  def index
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

  #assign a case to a support staff
  def assign

  end

  private
  def case_params
  	params.require(:cases).permit(:description, :resolution_note)
  end

  def find_case
  	@case = Case.find_by_id(params[:id])
  end
end
