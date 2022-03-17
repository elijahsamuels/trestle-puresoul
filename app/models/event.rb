class Event < ApplicationRecord

  has_many :users_to_events
  has_many :users, through: :users_to_events


  def primary_contact_full_name
    "#{primary_contact_first_name} #{primary_contact_last_name}"
  end

  def city_and_state
    "#{venue_city || "TBD"}, #{venue_state || "TBD"}"
  end

  def band_cost
    [
      musician_01_pay_rate.to_i, 
      musician_02_pay_rate.to_i, 
      musician_03_pay_rate.to_i, 
      musician_04_pay_rate.to_i, 
      musician_05_pay_rate.to_i, 
      musician_06_pay_rate.to_i, 
      musician_07_pay_rate.to_i, 
      musician_08_pay_rate.to_i, 
      musician_09_pay_rate.to_i, 
      musician_10_pay_rate.to_i, 
      musician_11_pay_rate.to_i, 
      musician_12_pay_rate.to_i, 
      musician_13_pay_rate.to_i, 
      musician_14_pay_rate.to_i, 
      musician_15_pay_rate.to_i, 
      musician_16_pay_rate.to_i, 
      musician_17_pay_rate.to_i, 
      musician_18_pay_rate.to_i, 
      musician_19_pay_rate.to_i, 
      musician_20_pay_rate.to_i 
    ].sum
  end

  def estimated_taxes_at_8_percent
    finances_total_price.to_i * 0.08
  end

  def profit_margin
    finances_total_price.to_i - band_cost - estimated_taxes_at_8_percent
  end

  def profit_margin_floor
    (finances_total_price.to_i - band_cost - estimated_taxes_at_8_percent).floor
  end

  def tel_to(phone_number)
    phone_number = number_to_phone(phone_number)
    link_to phone_number, "tel:#{phone_number}"
  end


  # def profit_margin_color
  #   if profit_margin > 500
  #     "green"
  #   else
  #     "red"
  #   end
  # end


  def all_confirmed
    Event.all.status == "Confirmed"
  end

end
