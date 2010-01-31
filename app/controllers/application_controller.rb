# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include FastGettext::Translation 
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_toppings, :set_gettext_locale, :correct_safari_and_ie_accept_headers
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

  def correct_safari_and_ie_accept_headers
    request.accepts.sort!{ |x, y| y.to_s == 'text/javascript' ? 1 : -1 } if request.xhr?
  end

  def gen_conditions(parameters, model)
    conds = []
    condvals = []
    columns = model.column_names
    parameters.each do |k, v|
      ks = k.to_s
      if columns.include? ks

        col = model.columns_hash[ks]
        case col.type
        when :string
          conds << " #{k} like ? "
          condvals << "%#{v}%"
        when :integer
          if v != ""
            conds << " #{k} = ? "
            condvals << v.to_i
          end
        when :float
          if v != ""
            conds << " #{k} = ? "
            condvals << v == v.to_f
          end
        end

      end
    end
    return [conds.join(' and '), *condvals]
  end

end
