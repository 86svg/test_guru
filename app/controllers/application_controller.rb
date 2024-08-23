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
    if params[:locale].present?
      if I18n.locale_available?(params[:locale])
        I18n.locale = params[:locale]
      else
        Rails.logger.warn("Неверная локаль: #{params[:locale]}")
        I18n.locale = I18n.default_locale
      end
    else
      Rails.logger.info("Локаль не задана, используется локаль по умолчанию: #{I18n.default_locale}")
      I18n.locale = I18n.default_locale
    end
  end
end
