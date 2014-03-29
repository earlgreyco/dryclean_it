require 'barby'
require 'barby/outputter/png_outputter'
require 'barby/barcode/code_93'

class Order < ActiveRecord::Base
  searchkick word_start: [:order_number, :tag_number, :total_price]
	include HasBarcode
	has_many :order_items
	belongs_to :user
	belongs_to :customer
  delegate :first_name, :last_name, :img, :phone, :credits, :starch, to: :customer, prefix: true
	validates_presence_of :customer_id, :user_id, :total_price
  scope :recent_ones_first, -> {order('created_at DESC')}
  scope :card, -> {where(payment_type: "card")}
  scope :cash, -> {where(payment_type: "cash")}
  scope :check, -> {where(payment_type: "check")}

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_93,
    :value => Proc.new { |p| "#{p.number}" }

  def self.total_on(date)
    where("date(created_at) = ?", date).sum(:total_price)
  end

  def self.total_with_credits(date)
    where("date(created_at) = ?", date).sum(:total_with_credits)
  end

  def self.total_credits_used(date)
    where("date(created_at) = ?", date).sum(:credits_used)
  end

  def number
    self.id
  end

  def recalculate_total_price
    self.total_price = 0
    self.order_items.each do |order_item|
      self.total_price = self.total_price + (order_item.quantity * order_item.price)
    end
    self.total_with_credits = self.total_price + self.credits_used
    self.save!
  end

  def recalculate_total_price_with_credits(payment_left)
    if payment_left <= 0
      self.credits_used = self.total_price
      self.total_price = 0
    else
      self.credits_used = self.total_price-payment_left
      self.total_price = payment_left
    end
    self.total_with_credits = self.total_price + self.credits_used
    self.save!
  end
end