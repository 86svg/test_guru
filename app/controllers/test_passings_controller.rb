# frozen_string_literal: true

class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passing.accept!(params[:answer_ids])
    if @test_passing.complited?
      TestsMailer.completed_test(@test_passing).deliver_now
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end
end
