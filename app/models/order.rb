class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  
  after_create :order_confirmation_email
  def order_confirmation_email
    UserMailer.order_confirmation_email(self).deliver
  end
end
