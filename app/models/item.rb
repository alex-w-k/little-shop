class Item < ApplicationRecord
  has_attached_file :image, styles: { thumbnail: "150x150", small: "250x250", medium: "500x500" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :category
  has_many :order_items
  has_many :reviews
  has_many :orders, through: :order_items

  validates :title, :description, :price,
            :inventory_status, :image, presence: true
  validates :title, uniqueness: true

  enum inventory_status: ["in-stock", "out-of-stock", "retired"]

  def self.retired?
    self.inventory_status == 'retired' ? true : false
  end

  def self.search(search)
    where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{search}%", "%#{search}%")
  end
end
