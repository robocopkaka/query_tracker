class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	respond_to do |format|
		if @category.save
			format.html{redirect_to :back}
			format.json{render :show, status: :created, location: @category}
		else
			format.html{render :new}
			format.json{render json: @category.errors, status: :unprocessible_entity}
		end
	end
  end

  def edit
  	@category = Category.find_by_id(params[:id])
  end

  def update
  	@category = Category.find_by_id(params[:id])
  	if @category.update_attributes(category_params)
  		redirect_to @category
  	else
  		render 'edit'
  	end
  end

  private
  def category_params
  	params.require(:category).permit(:name)
  end
end
