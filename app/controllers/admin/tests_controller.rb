class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :start, :update, :edit, :update_inline]

  def index
    @tests = Test.all
  end

  def show
    @question = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
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
    find_test.destroy # @test почему то nil
    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
