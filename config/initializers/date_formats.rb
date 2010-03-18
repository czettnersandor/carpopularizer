ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(:short => '%Y.%m.%d - %H:%M')
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(:short => '%Y.%m.%d - %H:%M')

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(:onlydate => '%Y.%m.%d')