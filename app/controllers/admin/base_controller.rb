# frozen_string_literal: true
class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    return if current_user.is_a?(Admin)

    redirect_to root_path,
                alert: 'Вы не авторизированны, чтоб просматривать данную страницу.'
  end
end
