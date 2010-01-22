module BoxesHelper
  MAKES = [
    _("Cabriolet"),
    _("Coupe"),
    _("Van"),         #Egyterű
    _("Hot Rod"),
    _("Estate-car"),  #Kombi
    _("Minibus"),
    _("Sedan"),       #Lépcsőshátú
    _("Pickup"),
    _("Sport"),
    _("Off-road"),
    _("Hatchback"),
    _("Old-timer")
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
    ["_0090_de_tomaso.png","De_Tomaso"],
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
    ["_0114_aston martin.png","Aston_Martin"],
    ["_0115_amc.png","Amc"],
    ["_0116_alpina.png","Alpina"],
    ["_0117_alfa_romeo.png","Alfa_Romeo"],
    ["_0118_aleko.png","Aleko"],
    ["_0119_aixam.png","Aixam"],
    ["_0120_adler.png","Adler"],
    ["_0121_acura.png","Acura"],
    ["_0122_abarth.png","Abarth"]
  ]
  def genrelist(selected_genre='_0006_volkswagen.png')
    opt_list = ""
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

  def makelist(selected_make='Cabriolet')
    opt_list = ""
    MAKES.each do |m|
      selected = selected_make == m ? ' selected="true">' : '>'
      opt_list += '<option value='+m+selected+ _(m) +'</option>'
    end
    return opt_list
  end
end
