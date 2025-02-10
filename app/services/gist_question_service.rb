require 'octokit'
require 'ostruct'

class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def call(public: true)
    response = @client.create_gist(gist_params(public))

    if response.status == 201
      OpenStruct.new(
        'html_url' => response.html_url,
        'success?' => true
      )
    else
      handle_error(response)
    end
  rescue Octokit::Error => e
    handle_error(e)
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

  def handle_error(response_or_error)
    error_message = if response_or_error.respond_to?(:message)
                      response_or_error.message
                    else
                      "Ошибка при создании Gist: #{response_or_error.body}"
                    end

    OpenStruct.new(
      'html_url' => nil,
      'success?' => false,
      'error' => error_message
    )
  end
end

