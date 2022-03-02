class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: [:index, :create, :new, :edit]
  before_action :find_question, only: [:show, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @collection = @test.questions
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_questions_path
    else
      render :edit
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_questions_path(@test)
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
