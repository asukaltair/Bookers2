class BooksController < ApplicationController

	before_action :authenticate_user!

	def create
		@user = User.find(current_user.id)
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		if @book.save
			redirect_to book_path(@book), notice: "You have creatad book successfully."
		else
			render :index
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def show
		@newbook = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user.id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(params[:id]), notice: "You have updated book successfully."
		else
			render :edit
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
