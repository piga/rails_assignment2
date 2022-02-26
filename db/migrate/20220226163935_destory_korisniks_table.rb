class DestoryKorisniksTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :korisniks
  end
end
