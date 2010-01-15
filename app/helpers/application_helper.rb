# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_url(params={})
    url_for :only_path=>false, :overwrite_params=>params
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
