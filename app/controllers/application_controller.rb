class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  helper_method :current_user,
                :logged_in?

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def default_url_options
    (I18n.locale != I18n.default_locale) ? { lang: I18n.locale } : {}
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
