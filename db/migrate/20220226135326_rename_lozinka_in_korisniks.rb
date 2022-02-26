class RenameLozinkaInKorisniks < ActiveRecord::Migration[6.1]
  def change
    change_table :korisniks do |t|
      t.rename :lozinka, :lozinka_digest
    end
  end
end
