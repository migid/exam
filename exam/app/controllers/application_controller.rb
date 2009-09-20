# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application", :except=>:login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale
  before_filter :authorize, :except=>:login
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  private
  def authorize
    unless session[:user]
      flash[:notice] = I18n.t("please_login")
      redirect_to :controller=>:admin
    end
  end

  def set_locale
    if request.env['HTTP_ACCEPT_LANGUAGE'].blank?
      I18n.locale = 'en'
    else
      I18n.locale = request.env['HTTP_ACCEPT_LANGUAGE'].split(",")[0]
    end
    locale_path = "#{RAILS_ROOT}/config/locales/#{I18n.locale}.yml"
    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)
    end
    rescue Exception => err
      logger.error err
      flash.now[:notice] = "#{I18n.locale} translation not available"
      I18n.load_path -= [locale_path]
      I18n.locale = session[:locale] = 'en'
    end
end
