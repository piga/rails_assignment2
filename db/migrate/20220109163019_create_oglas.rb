class CreateOglas < ActiveRecord::Migration[6.1]
  def change
    create_table :oglas do |t|
      t.string :naziv
      t.text :opis
      t.string :poslodavac
      t.string :email
      t.string :kategorija
      t.date :od
      t.date :do

      t.timestamps
    end
  end
end
