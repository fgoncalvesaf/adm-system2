class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :discount, optional: true
  has_many :items, :dependent => :destroy
  has_many :installments, :dependent => :delete_all
  enum status: [:pending, :paid]
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  validate :has_items?

  def has_items?
    errors.add(:base, " -- Precisa de ao menos um item.") if self.items.blank?
  end

  before_create do
  	if new_record?
  	  self.status = :pending

      @current_value = 0;
      self.items.each do |item|
        @current_value += item.product.price * item.quantity
      end

      if self.discount.blank?
        self.total = @current_value
      elsif self.discount.kind == 'money'
        self.total = @current_value - self.discount.value
      elsif self.discount.kind == 'percentage'
        self.total = @current_value * (1 - (self.discount.value/100))
      end 

      self.remaining = self.total
  	end
  end

  before_save do
    unless self.remaining.blank?
      if self.remaining <= 0
        self.remaining = 0
        self.status = :paid
      else
        self.status = :pending
      end
    end
  end
end
