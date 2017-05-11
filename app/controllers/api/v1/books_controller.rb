class Api::V1::BooksController < Api::V1::BaseController

	respond_to :json
	before_action :find_book, except: [:index, :create]

	def index		
		@books = Book.all
	end

	def show
	end

	def create # POST http://localhost:3000/api/v1/books.json
		@book = Book.new(book_params)
		if @book.save
			head :ok
		else
			head :unprocessable_entity
		end
	end

	def update # PATCH http://localhost:3000/api/v1/books/1.json
		@book.update_attributes(book_params)
		head :ok
	end

 	def destroy # DELETE http://localhost:3000/api/v1/books/1.json
 		@book.delete
  end

  private

	def book_params
		return {:title => params[:title], :description => params[:description], :year => params[:year], :author_id => params[:author_id], :genre_id => params[:genre_id]}.reject{|k,v| v.blank?}
	end

	def find_book
		@book = Book.find(params[:id])
	end
end

#  author_id         :integer
#  genre_id          :integer
#  title             :string
#  description       :text
#  cover_art         :string
#  cover_art_base_64 :text
#  year              :string