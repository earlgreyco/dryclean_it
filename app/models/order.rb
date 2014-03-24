require 'barby'
require 'barby/outputter/png_outputter'
require 'barby/barcode/code_93'

class Order < ActiveRecord::Base
	include HasBarcode
	has_many :order_items
	belongs_to :user
	belongs_to :customer
	validates_presence_of :customer_id, :user_id, :total_price

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_93,
    :value => Proc.new { |p| "#{p.number}" }

  def number
    self.id
  end
end