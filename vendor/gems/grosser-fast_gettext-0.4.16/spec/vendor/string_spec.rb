current_folder = File.dirname(__FILE__)
require File.join(current_folder,'..','spec_helper')

#just to make sure we did not mess up while copying...
describe String do
  it "does not translate twice" do
    ("%{a} %{b}" % {:a=>'%{b}',:b=>'c'}).should == '%{b} c'
  end

  describe "old % style replacement" do
    it "substitudes using % + Hash" do
      "x%{name}y" %{:name=>'a'}.should == 'xay'
    end

    it "does not substitute after %%" do
      ("%%{num} oops" % {:num => 1}).should == '%{num} oops'
    end

    it "does not substitute when nothing could be found" do
      ("abc" % {:x=>1}).should == 'abc'
    end

    it "sustitutes strings" do
      ("a%{b}c" % {'b'=>1}).should == 'a1c'
    end

    it "sustitutes strings with -" do
      ("a%{b-a}c" % {'b-a'=>1}).should == 'a1c'
    end

    it "sustitutes string with ." do
      ("a%{b.a}c" % {'b.a'=>1}).should == 'a1c'
    end

    it "sustitutes string with number" do
      ("a%{1}c" % {'1'=>1}).should == 'a1c'
    end
  end

  describe 'old sprintf style' do
    it "substitudes using % + Array" do
      ("x%sy%s" % ['a','b']).should == 'xayb'
    end

    it "does not remove %{} style replacements" do
      ("%{name} x%sy%s" % ['a','b']).should == '%{name} xayb'
    end

    it "does not remove %<> style replacement" do
       ("%{name} %<num>f %s" % ['x']).should == "%{name} %<num>f x"
    end
  end

  describe 'ruby 1.9 style %< replacement' do
    it "does not substitute after %%" do
      ("%%<num> oops" % {:num => 1}).should == '%<num> oops'
    end

    it "subsitutes %<something>d" do
      ("x%<hello>dy" % {:hello=>1}).should == 'x1y'
    end

    it "substitutes #b" do
      ("%<num>#b" % {:num => 1}).should == "0b1"
    end
  end
end