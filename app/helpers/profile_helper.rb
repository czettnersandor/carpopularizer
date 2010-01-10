module ProfileHelper
  FastGettext.add_text_domain 'app', :path => File.join(RAILS_ROOT, 'locale')
  FastGettext.text_domain = 'app'
  COUNTRIES = [
    ["ar", _("Argentina"),  ["2.5"]],
    ["au", _("Australia"),  ["2.0","2.1"]],
    ["at", _("Austria"),   ["1.0","2.0"]],
    ["be", _("Belgium"),  ["2.0"]],
    ["br", _("Brazil"),  ["2.0", "2.5"]],
    ["bg", _("Bulgaria"),  ["2.5"]],
    ["ca", _("Canada"),  ["2.0","2.5"]],
    ["cl", _("Chile"),  ["2.0"]],
    ["hr", _("Croatia"),  ["2.0","2.5"]],
    ["hu", _("Hungary"),  ["2.5"]],
    ["fi", _("Finland"),  ["1.0"]],
    ["fr", _("France"),  ["2.0"]],
    ["de", _("Germany"),  ["2.0","2.5"]],
    ["il", _("Israel"),  ["1.0"]],
    ["it", _("Italy"),  ["2.0"]],
    ["jp", _("Japan"),  ["2.0", "2.1"]],
    ["kr", _("Korea"),  ["2.0"]],
    ["my", _("Malaysia"),  ["2.5"]],
    ["nl", _("Netherlands"),  ["1.0","2.0", "2.5"]],
    ["pl", _("Poland"),  ["2.0", "2.5"]],
    ["si", _("Slovenia"),  ["2.5"]],
    ["za", _("South Africa"),  ["2.0", "2.5"]],
    ["es", _("Spain"),  ["2.0","2.1", "2.5"]],
    ["se", _("Sweden"),  ["2.5"]],
    ["tw", _("Taiwan"),  ["2.0"]],
    ["uk", _("UK: England & Wales"),  ["2.0"]],
    ["scotland", _("UK: Scotland"),  ["2.5"]]
  ]

  GENDER = {
    1 => _('Male'),
    2 => _('Female')
  }
  def countrylist(selected_country='hu')
    opt_list = ""
    COUNTRIES.each do |country|
      selected = selected_country == country[0] ? ' selected="true">' : '>'
      opt_list += '<option value='+country[0]+selected+country[1]+'</option>'
    end
    return opt_list
  end

  def gender(id)
    GENDER[id]
  end

end
