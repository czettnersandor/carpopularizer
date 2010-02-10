# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def admin_or_current?(user)
    if current_user
      current_user == user || current_user.has_role?('admin')
    else
      false
    end
  end

  def current_url(params={})
    url_for :only_path=>false, :overwrite_params=>params
  end

  def menu_link(title, url, css_class = "")
    if (request.url[0, url.length] == url || url_for(:only_path=>false)[0, url.length] == url)
      css_class += css_class=="" ? "active" : " active"
    end
    link_to title, url, :class => css_class
  end

  def menu_list(title, url, css_class = "")
    if (url_for[0, url.length] == url && url != "/")
      css_class += css_class=="" ? "active" : " active"
    end
    if (url == "/" && (url == url_for(:only_path=>false) || url_for == url))
      css_class += css_class=="" ? "active" : " active"
    end    
    '<li class="'+css_class+'">'+link_to(title, url)+'</li>'
  end

  def truncate_words(text, length = 5, end_string = ' …')
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  def shorten (string, count = 200)
    if string.length >= count
      shortened = string[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else
      string
    end
  end

end
