class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_record_id, :prefecture_id, :city, :house_number, :phone_number, :postal_code, :building_name, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :city
  validates :house_number
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  
  end

end