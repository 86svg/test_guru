# frozen_string_literal: true
class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show; end

  def edit; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'Вопрос не найден'
  end
end
