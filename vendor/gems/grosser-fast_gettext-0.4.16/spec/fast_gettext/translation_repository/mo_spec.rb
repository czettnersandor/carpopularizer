current_folder = File.dirname(__FILE__)
require File.join(current_folder,'..','..','spec_helper')


describe 'FastGettext::TranslationRepository::Mo' do
  before do
    @rep = FastGettext::TranslationRepository.build('test',:path=>File.join(current_folder,'..','..','locale'))
    @rep.is_a?(FastGettext::TranslationRepository::Mo).should be_true
  end

  it "can be built" do
    @rep.available_locales.should == ['de','en']
  end

  it "can translate" do
    FastGettext.locale = 'de'
    @rep['car'].should == 'Auto'
  end

  it "can pluralize" do
    FastGettext.locale = 'de'
    @rep.plural('Axis','Axis').should == ['Achse','Achsen']
  end

  it "has access to the mo repositories pluralisation rule" do
    FastGettext.locale = 'en'
    rep = FastGettext::TranslationRepository.build('plural_test',:path=>File.join(current_folder,'..','..','locale'))
    rep['car'].should == 'Test'#just check it is loaded correctly
    rep.pluralisation_rule.call(2).should == 3
  end
end