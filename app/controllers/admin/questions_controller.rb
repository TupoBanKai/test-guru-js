class Admin::QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new, :edit]
  before_action :find_question, only: [:show, :destroy, :edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @collection = @test.questions
  end

  def show
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.delete
    redirect_to questions_path
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
