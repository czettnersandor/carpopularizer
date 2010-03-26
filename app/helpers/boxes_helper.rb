module BoxesHelper
  FastGettext.add_text_domain 'app', :path => File.join(RAILS_ROOT, 'locale')
  FastGettext.text_domain = 'app'
  MAKES = [
    _("convertible"),
    _("coupe"),
    _("MPV"),
    _("short box"),
    _("hot rod"),
    _("van"),
    _("truck"),
    _("long box"),
    _("saloon"),
    _("pick-up"),
    _("sedan"),
    _("sport"),
    _("SUV"),
    _("other")
  ]

  COLORS = [
    _("black"),
    _("white"),
    _("silver"),
    _("red"),
    _("dark red"),
    _("green"),
    _("blue"),
    _("yellow"),
    _("purple"),
    _("brown"),
    _("pink"),
    _("champagne"),
    _("orange"),
    _("military"),
    _("beige"),
    _("sand"),
    _("turquise"),
  ]

  EQUIPMENT = {
    :fuggonylegzsak => {:pos => 0, :name => _("passenger airbag")},
    :hatsooldallegzsak => {:pos => 1, :name => _("airbags in the back")},
    :hatsolegzsak => {:pos => 2, :name => _("airbags in the back")},
    :utaslegzsak => {:pos => 3, :name => _("passenger airbag")},
    :im => {:pos => 4, :name => _("immobiliser")},
    :legzsakoff => {:pos => 5, :name => _("airbag off switch")},
    :vezetolegzsak => {:pos => 6, :name => _("driver's airbag")},
    :oldallegzsak => {:pos => 7, :name => _("side airbags")},
    :nincsforgalmi => {:pos => 8, :name => _("car document expired")},
    :csomaghalo => {:pos => 9, :name => _("package-locker net")},
    :tolatoradar => {:pos => 10, :name => _("reverse sensor")},
    :faberakas => {:pos => 11, :name => _("wooden package")},
    :bukocso => {:pos => 12, :name => _("reinforcement bars")},
    :alufelni => {:pos => 13, :name => _("aluminium wheel")},
    :hasznaltauto_beszamitas => {:pos => 14, :name => _("car set-off possible")},
    :torzskonyv => {:pos => 15, :name => "törzskönyv"}, #torzskonyv
    :pluss_karpit => {:pos => 16, :name => _("plush seats")},
    :kulfoldi_papirok => {:pos => 17, :name => _("has foreign documents")},
    :karbantartott => {:pos => 18, :name => _("often serviced")},
    :isof => {:pos => 19, :name => _("isofix system")},
    :full => {:pos => 20, :name => _("full extra")},
    :led => {:pos => 21, :name => _("led headlight")},
    :xen => {:pos => 22, :name => _("xenon headlight")},
    :gps => {:pos => 23, :name => _("gps")},
    :dvd => {:pos => 24, :name => _("dvd")},
    :cd => {:pos => 25, :name => _("cd player")},
    :comp => {:pos => 26, :name => _("main computer")},
    :esp => {:pos => 27, :name => _("esp")},
    :asr => {:pos => 28, :name => _("asr")},
    :abs => {:pos => 29, :name => _("abs")},
    :tempomat => {:pos => 30, :name => "tempomat"}, #tempomat
    :vonohorog => {:pos => 31, :name => _("dragbar")},
    :szinezettuveg => {:pos => 32, :name => _("tinted glass")},
    :kevesetfutott => {:pos => 33, :name => _("a few mileage")},
    :automatavalto => {:pos => 34, :name => _("automatic transmission")},
    :allithatokormany => {:pos => 35, :name => _("adjustable wheel")},
    :szervo => {:pos => 36, :name => _("power steering wheel")},
    :manualisvalto => {:pos => 37, :name => _("manual transmission")},
    :ulesmemoria => {:pos => 38, :name => _("driver's seat memory")},
    :allithato_hatso_ules => {:pos => 39, :name => _("adjustable back seats")},
    :allithato_ulesmagassag => {:pos => 40, :name => _("adjustable seat height")},
    :donthetoules => {:pos => 41, :name => _("adjustable passenger seat")},
    :napfenyteto => {:pos => 42, :name => _("moon roof")},
    :elektromosteto => {:pos => 43, :name => _("electric roof")},
    :el_ablak_elolhatul => {:pos => 44, :name => _("electric back window")},
    :riaszto => {:pos => 45, :name => _("alarm system")},
    :elektromos_ablak => {:pos => 46, :name => _("electric window")},
    :borbelso => {:pos => 47, :name => _("leather seats")},
    :osszkerek => {:pos => 48, :name => _("awd")},
    :futheto_tukor => {:pos => 49, :name => _("heated mirror")},
    :elektromos_tukor => {:pos => 50, :name => _("electric mirror")},
    :centralzar => {:pos => 51, :name => _("central lock")},
    :nemdohanyzo => {:pos => 52, :name => _("non smoking")},
    :szervizkonyv => {:pos => 53, :name => _("service book")},
    :taxi => {:pos => 54, :name => _("taxi")},
    :elsotulaj => {:pos => 55, :name => _("first owner")},
    :holgytulaj => {:pos => 56, :name => _("female owner")},
    :masodiktulaj => {:pos => 57, :name => _("second owner")},
    :garancialis => {:pos => 58, :name => _("valid guarantee")},
    :kodlampa => {:pos => 59, :name => _("fog light")},
    :szinesuveg => {:pos => 60, :name => _("tinted glass")},
    :cdtar => {:pos => 61, :name => _("cd case")},
    :garazsbantartott => {:pos => 62, :name => _("kept in garage")},
    :radiosmagno => {:pos => 63, :name => "radio"}, #radiosmagno
    :automataklima => {:pos => 64, :name => _("automatic A/C")},
    :manualklima => {:pos => 65, :name => _("manual A/C")}
  }

  FUELS = [
    _("Gasoline"),
    _("Diesel"),
    _("Gas"),
    _("Hybrid"),
    _("Biodiesel"),
    _("Electric"),
    _("Etanol")
  ]

  CONDITIONS = [
    _("brand new"),
    _("perfect"),
    _("like new"),
    _("well protected"),
    _("normal"),
    _("no damage"),
    _("engine problem"),
    _("crashed"),
    _("defective")
  ]

  GENRES = [
    ["_0000_zil.png", "Zil"],
    ["_0001_zaz.png", "Zaz"],
    ["_0002_zastava.png","Zastava"],
    ["_0003_yugo.png","Yugo"],
    ["_0004_westfield.png","Westfield"],
    ["_0005_volvo.png","Volvo"],
    ["_0006_volkswagen.png","Volkswagen"],
    ["_0007_volga.png","Volga"],
    ["_0008_vauxhall.png","Vauxhall"],
    ["_0009_uaz.png","Uaz"],
    ["_0010_triumph.png","Triumph"],
    ["_0011_trabant.png","Trabant"],
    ["_0012_toyota.png","Toyota"],
    ["_0013_tavirta.png","Tavirta"],
    ["_0014_tatra.png","Tatra"],
    ["_0015_tata.png","Tata"],
    ["_0016_talbot.png","Talbot"],
    ["_0017_suzuki.png","Suzuki"],
    ["_0018_sunbeam.png","Sunbeam"],
    ["_0019_subaru.png","Subaru"],
    ["_0020_studebaker.png","Studebaker"],
    ["_0021_ssangyong.png","Ssanyong"],
    ["_0022_spyker.png","Spyker"],
    ["_0023_smart.png","Smart"],
    ["_0024_skoda.png","Skoda"],
    ["_0025_simca.png","Smica"],
    ["_0026_seat.png","Seat"],
    ["_0027_scion.png","Scion"],
    ["_0028_saturn.png","Saturn"],
    ["_0029_saleen.png","Saleen"],
    ["_0030_saab.png","Saab"],
    ["_0031_rover.png","Rover"],
    ["_0032_rollsroyce.png","Rollsroyce"],
    ["_0033_roewe.png","Roewe"],
    ["_0034_renault.png","Renault"],
    ["_0035_proton.png","Proton"],
    ["_0036_perodua.png","Perodua"],
    ["_0037_porsche.png","Porsche"],
    ["_0038_pontiac.png","Pontiac"],
    ["_0039_plymoth.png","Plymoth"],
    ["_0040_piaggio.png","Piaggio"],
    ["_0041_pgo.png","Pgo"],
    ["_0042_peugeot.png","Peugeot"],
    ["_0043_panoz.png","Panoz"],
    ["_0044_pagani.png","Pagani"],
    ["_0045_packard.png","Packard"],
    ["_0046_opel.png","Opel"],
    ["_0047_Layer 2.png","Layer"],
    ["_0048_nissan.png","Nissan"],
    ["_0049_mitsubishi.png","Mitsubishi"],
    ["_0050_mini.png","Mini"],
    ["_0051_mg.png","Mg"],
    ["_0052_mercuy.png","Mercuy"],
    ["_0053_mercedesbenz.png","Mercedesbenz"],
    ["_0054_mazda.png","Mazda"],
    ["_0055_maybach.png","Maybach"],
    ["_0056_maserati.png","Maserati"],
    ["_0057_maruti.png","Maruti"],
    ["_0058_marcos.png","Marcos"],
    ["_0059_lotus.png","Lotus"],
    ["_0060_lincoln.png","Lincoln"],
    ["_0061_ligier.png","Ligier"],
    ["_0062_lexus.png","Lexus"],
    ["_0063_landrover.png","Landrover"],
    ["_0064_lancia.png","Lancia"],
    ["_0065_lamborghini.png","Lamborghini"],
    ["_0066_lada.png","Lada"],
    ["_0067_koenigsegg.png","Koenigsegg"],
    ["_0068_kia.png","Kia"],
    ["_0069_jeep.png","Jeep"],
    ["_0070_jaguar.png","Jaguar"],
    ["_0071_isuzu.png","Isuzu"],
    ["_0072_innocenti.png","Innocenti"],
    ["_0073_infiniti.png","Infiniti"],
    ["_0074_hyundai.png","Hyundai"],
    ["_0075_hummer.png","Hummer"],
    ["_0076_horch.png","Horch"],
    ["_0077_honda.png","Honda"],
    ["_0078_holden.png","Holden"],
    ["_0079_grecav.png","Grecav"],
    ["_0080_gmc.png","Gmc"],
    ["_0081_geely.png","Geely"],
    ["_0082_gaz.png","Gaz"],
    ["_0083_ford.png","Ford"],
    ["_0084_fisker.png","Fisker"],
    ["_0085_fiat.png","Fiat"],
    ["_0086_ferrari.png","Ferrari"],
    ["_0087_farboud.png","Farboud"],
    ["_0088_eagle.png","Eagle"],
    ["_0089_dodge.png","Dodge"],
    ["_0090_de_tomaso.png","De Tomaso"],
    ["_0091_datsun.png","Datsun"],
    ["_0092_daimler.png","Daimler"],
    ["_0093_daihatsu.png","Daihatsu"],
    ["_0094_daewoo.png","Daewoo"],
    ["_0095_dacia.png","Dacia"],
    ["_0096_covini.png","Corvini"],
    ["_0097_corvette.png","Corvette"],
    ["_0098_cizeta.png","Cizeta"],
    ["_0099_citroen.png","Citroen"],
    ["_0100_chrysler01.png","Chrysler01"],
    ["_0101_chrysler02.png","Chrysler02"],
    ["_0102_chevrolet.png","Checrolet"],
    ["_0103_chery.png","Chery"],
    ["_0104_caterham.png","Caterham"],
    ["_0105_cadilac.png","Cadilac"],
    ["_0106_buick.png","Buick"],
    ["_0107_bugatti.png","Bugatti"],
    ["_0108_brilliance.png","Brilliance"],
    ["_0109_bmw.png","Bmw"],
    ["_0110_bertone.png","Bertone"],
    ["_0111_bentley.png","Bentley"],
    ["_0113_audi.png","Audi"],
    ["_0114_aston martin.png","Aston Martin"],
    ["_0115_amc.png","Amc"],
    ["_0116_alpina.png","Alpina"],
    ["_0117_alfa_romeo.png","Alfa Romeo"],
    ["_0118_aleko.png","Aleko"],
    ["_0119_aixam.png","Aixam"],
    ["_0120_adler.png","Adler"],
    ["_0121_acura.png","Acura"],
    ["_0122_abarth.png","Abarth"]
  ]
  
  def genrelist(selected_genre='')
    opt_list = '<option value="">'+_('-- All --')+'</option>'
    GENRES.reverse.each do |genre|
      selected = selected_genre == genre[0] ? ' selected="true">' : '>'
      opt_list += '<option value='+genre[0]+selected+genre[1]+'</option>'
    end
    return opt_list
  end

  def genre(hash_id)
    GENRES.each do |genre|
      if hash_id == genre[0]
        return genre[1]
      end
    end
  end

  def makelist(selected_make='')
    opt_list = '<option value="">'+_('-- All --')+'</option>'
    MAKES.each do |m|
      selected = selected_make == m ? ' selected="true">' : '>'
      opt_list += '<option value='+m+selected+ _(m) +'</option>'
    end
    return opt_list
  end

  def fuellist(selected_fuel='')
    opt_list = '<option value="">'+_('-- All --')+'</option>'
    FUELS.each_with_index do |m, i|
      selected = selected_fuel == i+1 ? ' selected="true">' : '>'
      opt_list += '<option value='+(i+1).to_s+selected+ _(m) +'</option>'
    end
    return opt_list
  end
  def fuel_by_id(id=0)
    return "" if id==0 || id == nil
    _(FUELS[id-1])
  end

  def conditionlist(selected_cond='')
    opt_list = '<option value="">'+_('-- All --')+'</option>'
    CONDITIONS.each_with_index do |m, i|
      selected = selected_cond == i+1 ? ' selected="true">' : '>'
      opt_list += '<option value='+(i+1).to_s+selected+ _(m) +'</option>'
    end
    return opt_list
  end
  def condition_by_id(id=0)
    return "" if id==0 || id == nil
    _(CONDITIONS[id-1])
  end

  def colorlist(selected_color='')
    opt_list = '<option value="">'+_('-- All --')+'</option>'
    COLORS.each_with_index do |m, i|
      selected = selected_color == i+1 ? ' selected="true">' : '>'
      opt_list += '<option value='+(i+1).to_s+selected+ _(m) +'</option>'
    end
    return opt_list
  end

  def color_by_id(id=0)
    COLORS[id-1]
  end

  def eq_check(check_id, f)
    rval  = '<label for="car_equipment_'+check_id.to_s+'"'+
      ' style="background-position: 0 -'+(EQUIPMENT[check_id][:pos]*32).to_s+'px"'+
      ' class="'+check_id.to_s+'"'+
      ' title="'+EQUIPMENT[check_id][:name]+'">'+
      EQUIPMENT[check_id][:name]+'</label>'
    rval += f.check_box check_id
  end

  def eq_list(equipment)
    rval = ""
    EQUIPMENT.each_pair do |ekey, eq|
      if(equipment[ekey])
        rval += '<label style="background-position: 0 -'+(eq[:pos]*32).to_s+'px"'+
          ' class="'+ekey.to_s+'"'+
          ' title="'+eq[:name]+'">'
      end
    end
    rval
  end
  def eq_listitem(check_id)
    '<label style="background-position: 0 -'+(EQUIPMENT[check_id][:pos]*32).to_s+'px"'+
      ' class="'+check_id.to_s+'"'+
      ' title="'+EQUIPMENT[check_id][:name]+'">'+
      EQUIPMENT[check_id][:name]+'</label>'
  end

  # Label and value shows only if value is not empty
  def show_filled(label, value, unit='')
    if value != nil && value != ''
      value = value.to_s if not value.class == :string
      unit = unit.to_s if not unit.class == :string
      return '<label>'+label+'</label>'+'<span class="data">'+value+' '+unit+'</span>'
    end
  end
end
