# frozen_string_literal: true
class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy]
  before_action :set_locale
  def index
    @tests = Test.all
  end

  def edit; end

  def show
    @questions = @test.questions
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

  def set_test
    @test = Test.find_by(id: params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
