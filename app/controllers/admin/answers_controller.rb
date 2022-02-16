class Admin::AnswersController < Admin::BaseController
  before_action :find_test, only: [:index, :create, :new, :edit]
  before_action :find_question, only: [:index, :show, :destroy, :edit, :new, :create]
  before_action :find_answer, only: [:show, :edit, :destroy, :update]

  def index
    @collection = @question.answers
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_question_answers_path
    else
      render :edit
    end
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_test_question_answers_path
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_test_question_answers_path
  end

  private

   def answer_params
    params.require(:answer).permit(:correct, :flag)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
