class Resturant < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  searchkick

  has_many :reviews

  validates :name, :address, :phone, :website, :image, presence: true
  validates :phone, format: { with: /[\d -]{7,10}/,
    message: "format is wrong" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }
  validates :address, format: { with: /[\d,]+/,
    message: "Formated wrong" }
end
