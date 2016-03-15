class ClassifiedsController < ApplicationController
	def new
	end

	def index
		@classifieds = Classified.all
	end


end
