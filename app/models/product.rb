class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  def sale_message
    if price <= 2.0
      "Discount Item!"
    else
      "Everyday Value!"
    end
  end

  def sale_message_class_name
    if sale_message == "Discount Item!"
      "discount-item"
    else
      ""
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
