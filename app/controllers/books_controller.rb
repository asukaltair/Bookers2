class BooksController < ApplicationController

	before_action :authenticate_user!

	def create
		user = User.find(params[:user_id])
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
			redirect_to book_path(book)
		else
			redirect_to books_path
		end
	end

	def destroy
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
