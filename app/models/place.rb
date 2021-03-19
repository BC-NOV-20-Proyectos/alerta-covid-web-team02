class Place < ApplicationRecord
  belongs_to :institute
  #after_create :generate_code

  def generate_code
    txt_qr = "#{self.id}|#{self.name}"
    qr64 = QrController.create(txt_qr)
    #Place.update(self.id, :qr_image => qr64)
    place = Place.find(self.id)
    place.qr_image = qr64
    place.save
    
  end
end
