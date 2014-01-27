require "spec_helper"
require_relative "../../../lib/nickel/ztime"

describe Nickel::ZTime do
  describe "#modify_such_that_is_before" do
    specify "1200 to before 1200am is 1200" do
      expect(Nickel::ZTime.new("1200").modify_such_that_is_before(Nickel::ZTime.new("1200", :am))).to eq Nickel::ZTime.new("1200")
    end

    specify "1200 to before 1200pm is 1200am" do
      expect(Nickel::ZTime.new("1200").modify_such_that_is_before(Nickel::ZTime.new("1200", :pm))).to eq Nickel::ZTime.new("1200", :am)
    end

    specify "1 to before 2am is 1" do
      expect(Nickel::ZTime.new("1").modify_such_that_is_before(Nickel::ZTime.new("2", :am))).to eq Nickel::ZTime.new("1")
    end

    specify "10 to before 11pm is 10pm" do
      expect(Nickel::ZTime.new("10").modify_such_that_is_before(Nickel::ZTime.new("11", :pm))).to eq Nickel::ZTime.new("10", :pm)
    end

    specify "8 to before 11pm is 8" do
      expect(Nickel::ZTime.new("8").modify_such_that_is_before(Nickel::ZTime.new("12", :pm))).to eq Nickel::ZTime.new("8")
    end

    specify "0830 to before 0835am is 0830" do
      expect(Nickel::ZTime.new("0830").modify_such_that_is_before(Nickel::ZTime.new("0835", :am))).to eq Nickel::ZTime.new("0830")
    end

    specify "0830 to before 0835pm is 0830pm" do
      expect(Nickel::ZTime.new("0830").modify_such_that_is_before(Nickel::ZTime.new("0835", :pm))).to eq Nickel::ZTime.new("0830", :pm)
    end

    specify "0835 to before 0835pm is 0835" do
      expect(Nickel::ZTime.new("0835").modify_such_that_is_before(Nickel::ZTime.new("0835", :pm))).to eq Nickel::ZTime.new("0835")
    end

    specify "1021 to before 1223am is 1021pm" do
      expect(Nickel::ZTime.new("1021").modify_such_that_is_before(Nickel::ZTime.new("1223", :am))).to eq Nickel::ZTime.new("1021", :pm)
    end

    specify "12 to before 2am is 12am" do
      expect(Nickel::ZTime.new("12").modify_such_that_is_before(Nickel::ZTime.new("2", :am))).to eq Nickel::ZTime.new("12", :am)
    end

    specify "1220 to before 2am is 1220am" do
      expect(Nickel::ZTime.new("1220").modify_such_that_is_before(Nickel::ZTime.new("2", :am))).to eq Nickel::ZTime.new("1220", :am)
    end

    specify "1220 to before 12am is 1220" do
      expect(Nickel::ZTime.new("1220").modify_such_that_is_before(Nickel::ZTime.new("12", :am))).to eq Nickel::ZTime.new("1220")
    end

    specify "1220 to before 1220am is 1220" do
      expect(Nickel::ZTime.new("1220").modify_such_that_is_before(Nickel::ZTime.new("1220", :am))).to eq Nickel::ZTime.new("1220")
    end

    specify "0930 to before 5pm is 0930" do
      expect(Nickel::ZTime.new("0930").modify_such_that_is_before(Nickel::ZTime.new("5", :pm))).to eq Nickel::ZTime.new("0930")
    end

    specify "0930 to before 5am is 0930pm" do
      expect(Nickel::ZTime.new("0930").modify_such_that_is_before(Nickel::ZTime.new("5", :am))).to eq Nickel::ZTime.new("0930", :pm)
    end

    specify "1100 to before 0425pm is 1100" do
      expect(Nickel::ZTime.new("1100").modify_such_that_is_before(Nickel::ZTime.new("0425", :pm))).to eq Nickel::ZTime.new("1100")
    end

    specify "1100 to before 0425am is 1100pm" do
      expect(Nickel::ZTime.new("1100").modify_such_that_is_before(Nickel::ZTime.new("0425", :am))).to eq Nickel::ZTime.new("1100", :pm)
    end

    specify "0115 to before 0120am is 0115" do
      expect(Nickel::ZTime.new("0115").modify_such_that_is_before(Nickel::ZTime.new("0120", :am))).to eq Nickel::ZTime.new("0115")
    end

    specify "0115 to before 0120pm is 0115pm" do
      expect(Nickel::ZTime.new("0115").modify_such_that_is_before(Nickel::ZTime.new("0120", :pm))).to eq Nickel::ZTime.new("0115", :pm)
    end

    specify "1020 to before 1015am is 1020pm" do
      expect(Nickel::ZTime.new("1020").modify_such_that_is_before(Nickel::ZTime.new("1015", :am))).to eq Nickel::ZTime.new("1020", :pm)
    end

    specify "1020 to before 1015pm is 1020" do
      expect(Nickel::ZTime.new("1020").modify_such_that_is_before(Nickel::ZTime.new("1015", :pm))).to eq Nickel::ZTime.new("1020")
    end

    specify "1015 to before 1020am is 1015" do
      expect(Nickel::ZTime.new("1015").modify_such_that_is_before(Nickel::ZTime.new("1020", :am))).to eq Nickel::ZTime.new("1015")
    end

    specify "1015 to before 1020pm is 1015pm" do
      expect(Nickel::ZTime.new("1015").modify_such_that_is_before(Nickel::ZTime.new("1020", :pm))).to eq Nickel::ZTime.new("1015", :pm)
    end
  end

  describe "#modify_such_that_is_after" do
    specify "1200 to after 1200am is 1200am" do
      expect(Nickel::ZTime.new("1200").modify_such_that_is_after(Nickel::ZTime.new("1200", :pm))).to eq Nickel::ZTime.new("1200", :am)
    end

    specify "1200 to after 1200am is 1200" do
      expect(Nickel::ZTime.new("1200").modify_such_that_is_after(Nickel::ZTime.new("1200", :am))).to eq Nickel::ZTime.new("1200")
    end

    specify "2 to after 1am is 2" do
      expect(Nickel::ZTime.new("2").modify_such_that_is_after(Nickel::ZTime.new("1", :am))).to eq Nickel::ZTime.new("2")
    end

    specify "11 to after 10pm is 11pm" do
      expect(Nickel::ZTime.new("11").modify_such_that_is_after(Nickel::ZTime.new("10", :pm))).to eq Nickel::ZTime.new("11", :pm)
    end

    specify "12 to after 8am is 12" do
      expect(Nickel::ZTime.new("12").modify_such_that_is_after(Nickel::ZTime.new("8", :am))).to eq Nickel::ZTime.new("12")
    end

    specify "0835 to after 0830am is 0835" do
      expect(Nickel::ZTime.new("0835").modify_such_that_is_after(Nickel::ZTime.new("0830", :am))).to eq Nickel::ZTime.new("0835")
    end

    specify "0835 to after 0830pm is 0835pm" do
      expect(Nickel::ZTime.new("0835").modify_such_that_is_after(Nickel::ZTime.new("0830", :pm))).to eq Nickel::ZTime.new("0835", :pm)
    end

    specify "0835 to after 0835am is 0835pm" do
      expect(Nickel::ZTime.new("0835").modify_such_that_is_after(Nickel::ZTime.new("0835", :am))).to eq Nickel::ZTime.new("0835", :pm)
    end

    specify "0835 to after 0835pm is 0835" do
      expect(Nickel::ZTime.new("0835").modify_such_that_is_after(Nickel::ZTime.new("0835", :pm))).to eq Nickel::ZTime.new("0835")
    end

    specify "1223 to after 1021pm is 1223am" do
      expect(Nickel::ZTime.new("1223").modify_such_that_is_after(Nickel::ZTime.new("1021", :pm))).to eq Nickel::ZTime.new("1223", :am)
    end

    specify "2 to after 12am is 2" do
      expect(Nickel::ZTime.new("2").modify_such_that_is_after(Nickel::ZTime.new("12", :am))).to eq Nickel::ZTime.new("2")
    end

    specify "2 to after 1220am is 2" do
      expect(Nickel::ZTime.new("2").modify_such_that_is_after(Nickel::ZTime.new("1220", :am))).to eq Nickel::ZTime.new("2")
    end

    specify "12 to after 1220am is 12" do
      expect(Nickel::ZTime.new("12").modify_such_that_is_after(Nickel::ZTime.new("1220", :am))).to eq Nickel::ZTime.new("12")
    end

    specify "1220 to after 1220pm is 1220am" do
      expect(Nickel::ZTime.new("1220").modify_such_that_is_after(Nickel::ZTime.new("1220", :pm))).to eq Nickel::ZTime.new("1220", :am)
    end

    specify "5 to after 0930am is 5pm" do
      expect(Nickel::ZTime.new("5").modify_such_that_is_after(Nickel::ZTime.new("0930", :am))).to eq Nickel::ZTime.new("5", :pm)
    end

    specify "5 to after 0930pm is 5" do
      expect(Nickel::ZTime.new("5").modify_such_that_is_after(Nickel::ZTime.new("0930", :pm))).to eq Nickel::ZTime.new("5")
    end

    specify "0425 to after 1100am is 0425pm" do
      expect(Nickel::ZTime.new("0425").modify_such_that_is_after(Nickel::ZTime.new("1100", :am))).to eq Nickel::ZTime.new("0425", :pm)
    end

    specify "0425 to after 1100pm is 0425" do
      expect(Nickel::ZTime.new("0425").modify_such_that_is_after(Nickel::ZTime.new("1100", :pm))).to eq Nickel::ZTime.new("0425")
    end

    specify "0120 to after 0115am is 0120" do
      expect(Nickel::ZTime.new("0120").modify_such_that_is_after(Nickel::ZTime.new("0115", :am))).to eq Nickel::ZTime.new("0120")
    end

    specify "0120 to after 0115pm is 0120pm" do
      expect(Nickel::ZTime.new("0120").modify_such_that_is_after(Nickel::ZTime.new("0115", :pm))).to eq Nickel::ZTime.new("0120", :pm)
    end

    specify "1015 to after 1020pm is 1015" do
      expect(Nickel::ZTime.new("1015").modify_such_that_is_after(Nickel::ZTime.new("1020", :pm))).to eq Nickel::ZTime.new("1015")
    end

    specify "1015 to after 1020am is 1015pm" do
      expect(Nickel::ZTime.new("1015").modify_such_that_is_after(Nickel::ZTime.new("1020", :am))).to eq Nickel::ZTime.new("1015", :pm)
    end

    specify "1020 to after 1015pm is 1020pm" do
      expect(Nickel::ZTime.new("1020").modify_such_that_is_after(Nickel::ZTime.new("1015", :pm))).to eq Nickel::ZTime.new("1020", :pm)
    end

    specify "1020 to after 1015am is 1020" do
      expect(Nickel::ZTime.new("1020").modify_such_that_is_after(Nickel::ZTime.new("1015", :am))).to eq Nickel::ZTime.new("1020")
    end
  end

  describe "#am_pm_modifier" do

    context "passed one ztime" do
      it "sets am/pm if not set" do
        t = Nickel::ZTime.new("7", :pm)
        Nickel::ZTime.am_pm_modifier(t)
        expect(t).to eq Nickel::ZTime.new("7", :pm)
      end
    end

    context "passed two ztimes" do
      it "sets am/pm if not set" do
        tz = [Nickel::ZTime.new("7", :pm), Nickel::ZTime.new("8")]
        Nickel::ZTime.am_pm_modifier(*tz)
        expect(tz).to eq [Nickel::ZTime.new("7", :pm), Nickel::ZTime.new("8", :pm)]
      end
    end

    context "passed three ztimes" do
      it "sets am/pm if not set" do
        tz = [Nickel::ZTime.new("7", :pm), Nickel::ZTime.new("8", :pm), Nickel::ZTime.new("9")]
        Nickel::ZTime.am_pm_modifier(*tz)
        expect(tz).to eq [Nickel::ZTime.new("7", :pm), Nickel::ZTime.new("8", :pm), Nickel::ZTime.new("9", :pm)]
      end
    end

    context "passed five ztimes" do
      it "sets am/pm if not set" do
        tz = [Nickel::ZTime.new("7"), Nickel::ZTime.new("8", :am), Nickel::ZTime.new("9"), Nickel::ZTime.new("4", :pm), Nickel::ZTime.new("7")]
        Nickel::ZTime.am_pm_modifier(*tz)
        expect(tz).to eq [Nickel::ZTime.new("7", :am), Nickel::ZTime.new("8", :am), Nickel::ZTime.new("9", :am), Nickel::ZTime.new("4", :pm), Nickel::ZTime.new("7", :pm)]
      end
    end
  end
end
