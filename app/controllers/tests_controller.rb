class TestsController < ApplicationController

  before_action :find_test, only: [:start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.present?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:notice] = "Not enough questions"
      redirect_to tests_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
