# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:lang)', lang: /#{I18n.available_locales.join("|")}/ do
    root 'tests#index'

    devise_for :users, path: :gurus,
                      path_names: { sign_in: :login, sign_out: :logout },
                      controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

    resources :tests, only: :index do
      member do
        post :start
      end
    end

    resources :test_passings, only: %i[show update] do
      member do
        get :result
      end
    end

    resources :gists, only: :create

    namespace :admin do
      resources :gists, only: :index
      resources :tests do
        resources :questions, except: :index, shallow: true do
          resources :answers, except: :index, shallow: true
        end
      end
    end
  end
end
