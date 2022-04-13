class Admin::QuestionsController < Admin::BaseController
  
  before_action :find_question, only: [:destroy, :edit, :update, :show]
  before_action :find_test, only: [:create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def show
  end

  def edit 
  end

  def new
    @question = @test.questions.new
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@questions.test), notice: t('.deleted')
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: t('.edited')
    else
      render :edit
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_question_not_found
    render plain: 'Question not found'
  end
end