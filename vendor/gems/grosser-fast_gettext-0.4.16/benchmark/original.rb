require 'benchmark/base'

gem 'gettext', '>=2.0.0'
require 'gettext'
include GetText

self.locale = 'de'

puts "GetText #{GetText::VERSION}:"
bindtextdomain('test',:path=>locale_folder('test'))
results_test{_('car') == 'Auto'}

#i cannot add the large file, since its an internal applications mo file
bindtextdomain('large',:path=>locale_folder('large'))
results_large