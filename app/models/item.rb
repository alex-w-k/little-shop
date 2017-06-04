class Item < ApplicationRecord
  has_attached_file :image, styles: { thumbnail: "100x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, :description, :price, :inventory_status, :image, presence: true
  validates :title, uniqueness: true

  enum inventory_status: ["in-stock", "out-of-stock", "retired"]
end
