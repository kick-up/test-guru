class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit 
  end

  def create
    @test = Test.new(tests_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def tests_params
   params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

   def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def find_test
    @test = Test.find(params[:id])
  end
  
end
