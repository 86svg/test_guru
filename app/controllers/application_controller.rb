# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      super(resource)
    end
  end

  def default_url_options
    if I18n.locale == I18n.default_locale
      { lang: nil }
    else
      { lang: I18n.locale }
    end
  end

  private

  def set_locale
    I18n.locale = if I18n.locale_available?(params[:locale])
                    params[:locale]
                  else
                    I18n.default_locale
                  end
  end
end
