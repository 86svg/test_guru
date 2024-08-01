# frozen_string_literal: true

module ApplicationHelper
  def question_header(question)
    question.persisted? ? "Edit #{question.test.title} Question" : "Create New #{@test.title} Question"
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def current_year
    Time.current.year
  end

  def flash_message_for_user
    flash.map do |type, message|
      content_tag(:p, message, class: "flash #{type}")
    end.join.html_safe
  end
end
