module UsersHelper
  FastGettext.add_text_domain 'app', :path => File.join(RAILS_ROOT, 'locale')
  FastGettext.text_domain = 'app'
  COUNTRIES = [
    ["ar", _("Argentina")],
    ["au", _("Australia")],
    ["at", _("Austria")],
    ["be", _("Belgium")],
    ["br", _("Brazil")],
    ["bg", _("Bulgaria")],
    ["ca", _("Canada")],
    ["cl", _("Chile")],
    ["hr", _("Croatia")],
    ["h", _("Hungary")],
    ["fi", _("Finland")],
    ["fr", _("France")],
    ["de", _("Germany")],
    ["il", _("Israel")],
    ["it", _("Italy")],
    ["jp", _("Japan")],
    ["kr", _("Korea")],
    ["my", _("Malaysia")],
    ["nl", _("Netherlands")],
    ["pl", _("Poland")],
    ["si", _("Slovenia")],
    ["za", _("South Africa")],
    ["es", _("Spain")],
    ["se", _("Sweden")],
    ["tw", _("Taiwan")],
    ["uk", _("UK: England & Wales")],
    ["scotland", _("UK: Scotland")]
  ]

  GENDER = {
    1 => _('Male'),
    2 => _('Female')
  }
  def countrylist(selected_country='hu')
    opt_list = ""
    COUNTRIES.each do |country|
      selected = selected_country == country[0] ? ' selected="true">' : '>'
      opt_list += '<option value='+country[0]+selected+_(country[1])+'</option>'
    end
    return opt_list
  end
  def country_by_code(code_id='')
    _(COUNTRIES.detect {|c| c[0] == code_id}[1])
  end

  def gender(id)
    GENDER[id]
  end
end