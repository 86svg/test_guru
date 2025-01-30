class GistsController < ApplicationController
  def create
    test_passing = TestPassing.find(params[:id])
    if test_passing.nil?
      flash[:alert] = t('.not_found')
      redirect_to some_path and return
    end

    result = GistQuestionService.new(test_passing.current_question).call

    if result.success?
      gist = current_user.gists.build(url: result.html_url, question: test_passing.current_question)

      if gist.save
        flash[:notice] = t('.success', link: view_context.link_to('Gist', result.html_url, target: '_blank'))
      else
        flash[:alert] = t('.creation_failed', error: gist.errors.full_messages.to_sentence)
      end
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passing
  end
end
