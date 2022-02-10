class Admin::AnswersController < ApplicationController
  before_action :find_test, only: [:index, :create, :new, :edit]
  before_action :find_question, only: [:index, :show, :destroy, :edit]
  before_action :find_answer, only: [:show, :edit, :destroy]

  def index
    @collection = @question.answers
  end

  def show
  end

  def edit
  end

  def new
    @answers = Aswer.new
  end

  def create
    @answers = @questions.answers.new(answers_params)

    if @answers.save
      redirect_to admin_test_question_answers_path
    else
      render :new
    end
  end

  def destroy
    @answer.delete
    redirect_to admin_test_question_answers_path
  end

  private

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
