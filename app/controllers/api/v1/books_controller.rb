class Api::V1::BooksController < Api::V1::BaseController

	respond_to :json
	
	def index		
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

end
