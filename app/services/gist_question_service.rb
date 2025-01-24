require 'octokit'

class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def call(public: true)
    response = @client.create_gist(gist_params(public))
    OpenStruct.new(
      'html_url' => response&.html_url,
      'success?' => response.html_url.present?
    )
  end

  private

  def gist_params(public)
    {
      description: I18n.t(".services.gist_question_service.description", title: @test.title).to_s,
      public: public,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
