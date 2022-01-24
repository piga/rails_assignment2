class Ogla < ApplicationRecord
  #scope :aktivni_oglasi, -> {where(aktivan: true)}
  #scope :neaktivni_oglasi, -> {where(aktivan: false)}
  
  validates :naziv, presence: true
  validates :opis, presence: true, length: { minimum: 15 }
  validates :poslodavac, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  #validates :od, comparison: {less_than: :do}   ne radi ovo, samo u rails 7
 
  attr_reader :aktivan, :bool
  
  def aktivan
    if Date.today > self.do
      return true
    else
      return false
    end
  end
end
