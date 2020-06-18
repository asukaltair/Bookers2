class BooksController < ApplicationController

	before_action :authenticate_user!

	def create
		user = User.find(params[:user_id])
		book = Book.new(book_params)
		book.user_id = current_user.id
		book.save
		redirect_to book_path(book.id)
	end

	def destroy
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
