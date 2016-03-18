class ClassifiedsController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create ]


	def index
		@classifieds = Classified.all
		@categories = Category.all
	end
	
	def new
		@classified = Classified.new
		@classified.build_category
	end

	def create
		@classified = current_user.classifieds.build(safe_classified_params)
		@classified.build_category(safe_category_params)

		if @classified.save
			redirect_to classifieds_path
		else
			render 'new'
		end
	end

	def my
		@classifieds = current_user.classifieds

		render 'index'
	end

	def destroy
		@classified = current_user.classifieds.find(params[:id])
		@classified.destroy

		redirect_to my_classifieds_path
	end

private

	def safe_classified_params
		params.require(:classified).permit(:title, :price, :description, :image)
	end

	def safe_category_params
		params.require(:category).permit(:name)
	end
end
