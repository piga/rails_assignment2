class Prijava < ApplicationRecord
  belongs_to :ogla
  
  SPREMA_OPTIONS = ["VSS", "VŠS", "SSS", "NK"]
  
  validates :ime_i_prezime, :dat_rodenja, :email, :telefon, :boraviste, :str_sprema, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :telefon, numericality: true
  validates_inclusion_of :str_sprema, in: SPREMA_OPTIONS
end
