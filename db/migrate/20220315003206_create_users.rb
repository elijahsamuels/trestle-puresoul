class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :band_area_1
      t.string :band_area_2
      t.string :band_area_3
      t.string :band_area_4
      t.string :band_area_5
      t.string :band_area_6
      t.string :band_area_7
      t.string :band_area_8
      t.string :band_area_9
      t.string :preferred_first_name
      t.string :preferred_last_name
      t.string :nick_name
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :password_digest
      t.string :staff_rating
      t.text :staff_notes
      t.string :tax_first_name
      t.string :tax_last_name
      t.string :tax_address1
      t.string :tax_address2
      t.string :tax_city
      t.string :tax_state
      t.string :tax_zip
      t.string :tax_country
      t.string :tax_id_number
      t.string :name_on_bank_account
      t.string :bank_routing_number
      t.string :bank_account_number
      t.string :primary_instrument
      t.string :secondary_instrument
      t.string :tertiary_instrument
      t.text :song_list
      t.string :has_car
      t.string :has_sound_system
      t.string :has_lighting_system
      t.string :has_battery_generator
      t.string :will_play_fever_events
      t.string :will_play_wedding_receptions
      t.string :will_play_ceremonies
      t.string :will_travel_overnight
      t.string :will_travel_international
      t.string :can_emcee
      t.string :can_lead_band
      t.string :meal_preference
      t.string :passport_number
      t.string :passport_expiration
      t.string :passport_date_issued
      t.string :passport_first_name
      t.string :passport_last_name
      t.string :passport_birth_date
      t.string :passport_city_of_birth
      t.string :passport_state_of_birth
      t.string :passport_country_of_birth
      t.string :passport_nationality

      t.timestamps
    end
  end
end
