desc "Update pot/po files to match new version."
task :updatepo do
  MY_APP_TEXT_DOMAIN = "boxutca"
  MY_APP_VERSION     = "boxutca 1.1.0"
  GetText.update_pofiles(YOUR_APP_TEXT_DOMAIN,
    Dir.glob("{app,lib}/**/*.{rb,rhtml}"),
    MY_APP_VERSION)
end

require 'gettext/utils'
desc "Create mo-files for L10n"
task :makemo do
  GetText.create_mofiles(true, "po", "locale")
end