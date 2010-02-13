require 'hpricot'

class Video < ActiveRecord::Base

  def hit!
    self.class.increment_counter :hits, id
  end

  def video_id
    unless url.nil?
      # Check whether Youtube embed code was entered
      doc = Hpricot.parse(url)

      #Check if there is a movie param
      embed_url = if (element = doc % "//param[@name='movie']")
        element.attributes["value"]
      elsif (element = doc % "//embed") #Check for the movie code in the embed element
        element.attributes["src"]
      end

      #If we have pulled out a URL from the embed code, get the v param
      if embed_url && (match = %r{/v/(\w+)&}.match(embed_url))
        return match[1]
      end

      #If the user entered the video page url
      query_string = url.split( '?', 2)[1]
      if query_string
        params = CGI.parse(query_string)
        if params.has_key?("v")
          return params["v"][0]
        end
      end
    end
  end

end
