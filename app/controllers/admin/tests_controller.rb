# frozen_string_literal: true
class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy update_inline]
  before_action :set_tests, only: %i[index update_inline]
  #before_action :set_locale
  def index; end

  def edit; end

  def show
    @questions = @test.questions
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_test_path(@test)
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find_by(id: params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
