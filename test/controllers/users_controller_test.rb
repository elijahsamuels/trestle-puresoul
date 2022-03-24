require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { address1: @user.address1, address2: @user.address2, band_area_1: @user.band_area_1, band_area_2: @user.band_area_2, band_area_3: @user.band_area_3, band_area_4: @user.band_area_4, band_area_5: @user.band_area_5, band_area_6: @user.band_area_6, band_area_7: @user.band_area_7, band_area_8: @user.band_area_8, band_area_9: @user.band_area_9, bank_account_number: @user.bank_account_number, bank_routing_number: @user.bank_routing_number, can_emcee: @user.can_emcee, can_lead_band: @user.can_lead_band, city: @user.city, country: @user.country, email: @user.email, has_battery_generator: @user.has_battery_generator, has_car: @user.has_car, has_lighting_system: @user.has_lighting_system, has_sound_system: @user.has_sound_system, meal_preference: @user.meal_preference, name_on_bank_account: @user.name_on_bank_account, nick_name: @user.nick_name, passport_birth_date: @user.passport_birth_date, passport_city_of_birth: @user.passport_city_of_birth, passport_country_of_birth: @user.passport_country_of_birth, passport_date_issued: @user.passport_date_issued, passport_expiration: @user.passport_expiration, passport_first_name: @user.passport_first_name, passport_last_name: @user.passport_last_name, passport_nationality: @user.passport_nationality, passport_number: @user.passport_number, passport_state_of_birth: @user.passport_state_of_birth, password_digest: @user.password_digest, phone: @user.phone, preferred_first_name: @user.preferred_first_name, preferred_last_name: @user.preferred_last_name, primary_instrument: @user.primary_instrument, secondary_instrument: @user.secondary_instrument, song_list: @user.song_list, staff_notes: @user.staff_notes, staff_rating: @user.staff_rating, state: @user.state, tax_address1: @user.tax_address1, tax_address2: @user.tax_address2, tax_city: @user.tax_city, tax_country: @user.tax_country, tax_first_name: @user.tax_first_name, tax_id_number: @user.tax_id_number, tax_last_name: @user.tax_last_name, tax_state: @user.tax_state, tax_zip: @user.tax_zip, tertiary_instrument: @user.tertiary_instrument, will_play_ceremonies: @user.will_play_ceremonies, will_play_fever_events: @user.will_play_fever_events, will_play_wedding_receptions: @user.will_play_wedding_receptions, will_travel_international: @user.will_travel_international, will_travel_overnight: @user.will_travel_overnight, zip: @user.zip } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address1: @user.address1, address2: @user.address2, band_area_1: @user.band_area_1, band_area_2: @user.band_area_2, band_area_3: @user.band_area_3, band_area_4: @user.band_area_4, band_area_5: @user.band_area_5, band_area_6: @user.band_area_6, band_area_7: @user.band_area_7, band_area_8: @user.band_area_8, band_area_9: @user.band_area_9, bank_account_number: @user.bank_account_number, bank_routing_number: @user.bank_routing_number, can_emcee: @user.can_emcee, can_lead_band: @user.can_lead_band, city: @user.city, country: @user.country, email: @user.email, has_battery_generator: @user.has_battery_generator, has_car: @user.has_car, has_lighting_system: @user.has_lighting_system, has_sound_system: @user.has_sound_system, meal_preference: @user.meal_preference, name_on_bank_account: @user.name_on_bank_account, nick_name: @user.nick_name, passport_birth_date: @user.passport_birth_date, passport_city_of_birth: @user.passport_city_of_birth, passport_country_of_birth: @user.passport_country_of_birth, passport_date_issued: @user.passport_date_issued, passport_expiration: @user.passport_expiration, passport_first_name: @user.passport_first_name, passport_last_name: @user.passport_last_name, passport_nationality: @user.passport_nationality, passport_number: @user.passport_number, passport_state_of_birth: @user.passport_state_of_birth, password_digest: @user.password_digest, phone: @user.phone, preferred_first_name: @user.preferred_first_name, preferred_last_name: @user.preferred_last_name, primary_instrument: @user.primary_instrument, secondary_instrument: @user.secondary_instrument, song_list: @user.song_list, staff_notes: @user.staff_notes, staff_rating: @user.staff_rating, state: @user.state, tax_address1: @user.tax_address1, tax_address2: @user.tax_address2, tax_city: @user.tax_city, tax_country: @user.tax_country, tax_first_name: @user.tax_first_name, tax_id_number: @user.tax_id_number, tax_last_name: @user.tax_last_name, tax_state: @user.tax_state, tax_zip: @user.tax_zip, tertiary_instrument: @user.tertiary_instrument, will_play_ceremonies: @user.will_play_ceremonies, will_play_fever_events: @user.will_play_fever_events, will_play_wedding_receptions: @user.will_play_wedding_receptions, will_travel_international: @user.will_travel_international, will_travel_overnight: @user.will_travel_overnight, zip: @user.zip } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
