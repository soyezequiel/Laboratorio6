class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  has_many :tweets
  validate :numero_de_telefono_tiene_que_ser_valido
  has_many_attached :image

    def numero_de_telefono_tiene_que_ser_valido
      if Phone.new(phone).valid?
        return
      else
        errors.add(:phone, :invalid, message: "pepito")
      end

    end
  end
