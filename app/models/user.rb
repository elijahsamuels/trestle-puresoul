class User < ApplicationRecord

  has_many :events
  has_many :users_to_events, through: :events, foreign_key: :event_id


  # @all_us_states = [ "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

  def full_name
    preferred_first_name + " " + preferred_last_name
  end

  
  # def tel_to(phone_number)
  #   phone_number = number_to_phone(phone_number)
  #   link_to phone_number, "tel:#{phone_number}"
  # end


end
