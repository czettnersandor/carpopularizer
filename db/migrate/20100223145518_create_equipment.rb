class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.integer :car_id
      t.boolean :fuggonylegzsak
      t.boolean :hatsooldallegzsak
      t.boolean :hatsolegzsak
      t.boolean :utaslegzsak
      t.boolean :im
      t.boolean :legzsakoff
      t.boolean :vezetolegzsak
      t.boolean :oldallegzsak
      t.boolean :nincsforgalmi
      t.boolean :csamaghalo
      t.boolean :tolatoradar
      t.boolean :faberakas
      t.boolean :bukocso
      t.boolean :alufelni
      t.boolean :hasznaltauto_beszamitas
      t.boolean :torzskonyv
      t.boolean :pluss_karpit
      t.boolean :kulfoldi_papirok
      t.boolean :karbantartott
      t.boolean :isof
      t.boolean :full
      t.boolean :led
      t.boolean :xen
      t.boolean :gps
      t.boolean :dvd
      t.boolean :cd
      t.boolean :comp
      t.boolean :esp
      t.boolean :asr
      t.boolean :abs
      t.boolean :tempomat
      t.boolean :vonohorog
      t.boolean :szinezettuveg
      t.boolean :kevesetfutott
      t.boolean :automatavalto
      t.boolean :allithatokormany
      t.boolean :szervo
      t.boolean :manualisvalto
      t.boolean :ulesmemoria
      t.boolean :allithato_hatso_ules
      t.boolean :allithato_ulesmagassag
      t.boolean :donthetoules
      t.boolean :napfenyteto
      t.boolean :elektromosteto
      t.boolean :el_ablak_elolhatul
      t.boolean :riaszto
      t.boolean :elektromos_ablak
      t.boolean :borbelso
      t.boolean :osszkerek
      t.boolean :futheto_tukor
      t.boolean :elektromos_tukor
      t.boolean :centralzar
      t.boolean :nemdohanyzo
      t.boolean :szervizkonyv
      t.boolean :taxi
      t.boolean :elsotulaj
      t.boolean :holgytulaj
      t.boolean :masodiktulaj
      t.boolean :garancialis
      t.boolean :kodlampa
      t.boolean :szinesuveg
      t.boolean :cdtar
      t.boolean :garazsbantartott
      t.boolean :radiosmagno
      t.boolean :automataklima
      t.boolean :manualklima

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment
  end
end
