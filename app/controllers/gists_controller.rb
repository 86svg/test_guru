class GistsController < ApplicationController
  def create
    test_passing = TestPassing.find(params[:id])
    result = GistQuestionService.new(test_passing.current_question).call

    if result.success?
      Gist.create!(url: result.html_url, question: test_passing.current_question, author: current_user)

      flash[:notice] = t('.success', link: view_context.link_to('Gist', result.html_url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passing
  end
end
