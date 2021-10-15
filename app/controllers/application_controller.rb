class ApplicationController < ActionController::Base

  protected

  def configure_permitted_parameters
    # アカウントの新規登録時に setting を受け取れるようにする
    devise_parameter_sanitizer.permit(:sign_up, keys: [:setting])

    # アカウントの更新時に setting を受け取れるようにする
    devise_parameter_sanitizer.permit(:account_update, keys: [:setting])
  end

end
