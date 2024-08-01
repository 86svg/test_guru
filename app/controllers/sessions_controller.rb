# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      requested_page = cookies[:requested_page]
      cookies.delete(:requested_page) if requested_page.present?
      redirect_to requested_page || root_path
    else
      flash.now[:alert] = 'Verify login and password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
