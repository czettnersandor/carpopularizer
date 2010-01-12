# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_toppings, :set_gettext_locale
  include AuthenticatedSystem

  layout "main"

  protected

  def set_toppings
    # set variables which needed everywhere
  end

  def set_gettext_locale
    FastGettext.text_domain = 'app'
    FastGettext.available_locales = ['en','hu'] #all you want to allow
    super
  end

end
