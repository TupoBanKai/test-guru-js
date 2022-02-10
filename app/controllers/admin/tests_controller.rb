class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :start, :desrtoy, :update, :edit]

  def index
    @tests = Test.all
  end

  def show
    @question = @test.questions
  end

  def edit
  end

  def new
    @test = Test.new
  end

  def create
    current_user.created_tests.create(test_params)
    redirect_to admin_tests_path, notice: t('.success')
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
