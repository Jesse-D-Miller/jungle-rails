class Admin::CategoriesController < ApplicationController
http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

end
