# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fast_gettext}
  s.version = "0.4.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2009-09-22}
  s.email = %q{grosser.michael@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "README.markdown",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "benchmark/base.rb",
     "benchmark/baseline.rb",
     "benchmark/fast_gettext.rb",
     "benchmark/i18n_simple.rb",
     "benchmark/ideal.rb",
     "benchmark/locale/de.yml",
     "benchmark/locale/de/LC_MESSAGES/large.mo",
     "benchmark/misc/threadsave.rb",
     "benchmark/namespace/fast_gettext.rb",
     "benchmark/namespace/original.rb",
     "benchmark/original.rb",
     "examples/db/migration.rb",
     "examples/missing_translation_logger.rb",
     "fast_gettext.gemspec",
     "lib/fast_gettext.rb",
     "lib/fast_gettext.rb",
     "lib/fast_gettext/mo_file.rb",
     "lib/fast_gettext/mo_file.rb",
     "lib/fast_gettext/po_file.rb",
     "lib/fast_gettext/po_file.rb",
     "lib/fast_gettext/storage.rb",
     "lib/fast_gettext/storage.rb",
     "lib/fast_gettext/translation.rb",
     "lib/fast_gettext/translation.rb",
     "lib/fast_gettext/translation_repository.rb",
     "lib/fast_gettext/translation_repository.rb",
     "lib/fast_gettext/translation_repository/base.rb",
     "lib/fast_gettext/translation_repository/base.rb",
     "lib/fast_gettext/translation_repository/chain.rb",
     "lib/fast_gettext/translation_repository/chain.rb",
     "lib/fast_gettext/translation_repository/db.rb",
     "lib/fast_gettext/translation_repository/db.rb",
     "lib/fast_gettext/translation_repository/db_models/translation_key.rb",
     "lib/fast_gettext/translation_repository/db_models/translation_key.rb",
     "lib/fast_gettext/translation_repository/db_models/translation_text.rb",
     "lib/fast_gettext/translation_repository/db_models/translation_text.rb",
     "lib/fast_gettext/translation_repository/logger.rb",
     "lib/fast_gettext/translation_repository/logger.rb",
     "lib/fast_gettext/translation_repository/mo.rb",
     "lib/fast_gettext/translation_repository/mo.rb",
     "lib/fast_gettext/translation_repository/po.rb",
     "lib/fast_gettext/translation_repository/po.rb",
     "spec/aa_unconfigued_spec.rb",
     "spec/aa_unconfigued_spec.rb",
     "spec/fast_gettext/mo_file_spec.rb",
     "spec/fast_gettext/mo_file_spec.rb",
     "spec/fast_gettext/storage_spec.rb",
     "spec/fast_gettext/storage_spec.rb",
     "spec/fast_gettext/translation_repository/base_spec.rb",
     "spec/fast_gettext/translation_repository/base_spec.rb",
     "spec/fast_gettext/translation_repository/chain_spec.rb",
     "spec/fast_gettext/translation_repository/chain_spec.rb",
     "spec/fast_gettext/translation_repository/db_spec.rb",
     "spec/fast_gettext/translation_repository/db_spec.rb",
     "spec/fast_gettext/translation_repository/logger_spec.rb",
     "spec/fast_gettext/translation_repository/logger_spec.rb",
     "spec/fast_gettext/translation_repository/mo_spec.rb",
     "spec/fast_gettext/translation_repository/mo_spec.rb",
     "spec/fast_gettext/translation_repository/po_spec.rb",
     "spec/fast_gettext/translation_repository/po_spec.rb",
     "spec/fast_gettext/translation_spec.rb",
     "spec/fast_gettext/translation_spec.rb",
     "spec/fast_gettext_spec.rb",
     "spec/fast_gettext_spec.rb",
     "spec/locale/de/LC_MESSAGES/test.mo",
     "spec/locale/de/LC_MESSAGES/test.mo",
     "spec/locale/de/test.po",
     "spec/locale/de/test.po",
     "spec/locale/en/LC_MESSAGES/plural_test.mo",
     "spec/locale/en/LC_MESSAGES/plural_test.mo",
     "spec/locale/en/LC_MESSAGES/test.mo",
     "spec/locale/en/LC_MESSAGES/test.mo",
     "spec/locale/en/plural_test.po",
     "spec/locale/en/plural_test.po",
     "spec/locale/en/test.po",
     "spec/locale/en/test.po",
     "spec/spec_helper.rb",
     "spec/spec_helper.rb",
     "spec/vendor/fake_load_path/iconv.rb",
     "spec/vendor/fake_load_path/iconv.rb",
     "spec/vendor/iconv_spec.rb",
     "spec/vendor/iconv_spec.rb",
     "spec/vendor/string_spec.rb",
     "spec/vendor/string_spec.rb",
     "vendor/README.rdoc",
     "vendor/README.rdoc",
     "vendor/empty.mo",
     "vendor/empty.mo",
     "vendor/iconv.rb",
     "vendor/iconv.rb",
     "vendor/mofile.rb",
     "vendor/mofile.rb",
     "vendor/poparser.rb",
     "vendor/poparser.rb",
     "vendor/string.rb",
     "vendor/string.rb"
  ]
  s.homepage = %q{http://github.com/grosser/fast_gettext}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A simple, fast and threadsafe implementation of GetText}
  s.test_files = [
    "spec/fast_gettext_spec.rb",
     "spec/spec_helper.rb",
     "spec/fast_gettext/translation_spec.rb",
     "spec/fast_gettext/storage_spec.rb",
     "spec/fast_gettext/translation_repository/chain_spec.rb",
     "spec/fast_gettext/translation_repository/logger_spec.rb",
     "spec/fast_gettext/translation_repository/base_spec.rb",
     "spec/fast_gettext/translation_repository/po_spec.rb",
     "spec/fast_gettext/translation_repository/db_spec.rb",
     "spec/fast_gettext/translation_repository/mo_spec.rb",
     "spec/fast_gettext/mo_file_spec.rb",
     "spec/aa_unconfigued_spec.rb",
     "spec/vendor/iconv_spec.rb",
     "spec/vendor/fake_load_path/iconv.rb",
     "spec/vendor/string_spec.rb",
     "examples/db/migration.rb",
     "examples/missing_translation_logger.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
