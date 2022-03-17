require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Address1", with: @user.address1
    fill_in "Address2", with: @user.address2
    fill_in "Band area 1", with: @user.band_area_1
    fill_in "Band area 2", with: @user.band_area_2
    fill_in "Band area 3", with: @user.band_area_3
    fill_in "Band area 4", with: @user.band_area_4
    fill_in "Band area 5", with: @user.band_area_5
    fill_in "Band area 6", with: @user.band_area_6
    fill_in "Band area 7", with: @user.band_area_7
    fill_in "Band area 8", with: @user.band_area_8
    fill_in "Band area 9", with: @user.band_area_9
    fill_in "Bank account number", with: @user.bank_account_number
    fill_in "Bank routing number", with: @user.bank_routing_number
    fill_in "Can emcee", with: @user.can_emcee
    fill_in "Can lead band", with: @user.can_lead_band
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Email", with: @user.email
    fill_in "Has battery generator", with: @user.has_battery_generator
    fill_in "Has car", with: @user.has_car
    fill_in "Has lighting system", with: @user.has_lighting_system
    fill_in "Has sound system", with: @user.has_sound_system
    fill_in "Meal prefference", with: @user.meal_prefference
    fill_in "Name on bank account", with: @user.name_on_bank_account
    fill_in "Nick name", with: @user.nick_name
    fill_in "Passport birth date", with: @user.passport_birth_date
    fill_in "Passport city of birth", with: @user.passport_city_of_birth
    fill_in "Passport country of birth", with: @user.passport_country_of_birth
    fill_in "Passport date issued", with: @user.passport_date_issued
    fill_in "Passport expiration", with: @user.passport_expiration
    fill_in "Passport first name", with: @user.passport_first_name
    fill_in "Passport last name", with: @user.passport_last_name
    fill_in "Passport nationality", with: @user.passport_nationality
    fill_in "Passport number", with: @user.passport_number
    fill_in "Passport state of birth", with: @user.passport_state_of_birth
    fill_in "Password digest", with: @user.password_digest
    fill_in "Phone", with: @user.phone
    fill_in "Preferred first name", with: @user.preferred_first_name
    fill_in "Preferred last name", with: @user.preferred_last_name
    fill_in "Primary instrument", with: @user.primary_instrument
    fill_in "Secondary instrument", with: @user.secondary_instrument
    fill_in "Song list", with: @user.song_list
    fill_in "Staff notes", with: @user.staff_notes
    fill_in "Staff rating", with: @user.staff_rating
    fill_in "State", with: @user.state
    fill_in "Tax address1", with: @user.tax_address1
    fill_in "Tax address2", with: @user.tax_address2
    fill_in "Tax city", with: @user.tax_city
    fill_in "Tax country", with: @user.tax_country
    fill_in "Tax first name", with: @user.tax_first_name
    fill_in "Tax id number", with: @user.tax_id_number
    fill_in "Tax last name", with: @user.tax_last_name
    fill_in "Tax state", with: @user.tax_state
    fill_in "Tax zip", with: @user.tax_zip
    fill_in "Tertiary instrument", with: @user.tertiary_instrument
    fill_in "Will play ceremonies", with: @user.will_play_ceremonies
    fill_in "Will play fever events", with: @user.will_play_fever_events
    fill_in "Will play wedding receptions", with: @user.will_play_wedding_receptions
    fill_in "Will travel international", with: @user.will_travel_international
    fill_in "Will travel overnight", with: @user.will_travel_overnight
    fill_in "Zip", with: @user.zip
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Address1", with: @user.address1
    fill_in "Address2", with: @user.address2
    fill_in "Band area 1", with: @user.band_area_1
    fill_in "Band area 2", with: @user.band_area_2
    fill_in "Band area 3", with: @user.band_area_3
    fill_in "Band area 4", with: @user.band_area_4
    fill_in "Band area 5", with: @user.band_area_5
    fill_in "Band area 6", with: @user.band_area_6
    fill_in "Band area 7", with: @user.band_area_7
    fill_in "Band area 8", with: @user.band_area_8
    fill_in "Band area 9", with: @user.band_area_9
    fill_in "Bank account number", with: @user.bank_account_number
    fill_in "Bank routing number", with: @user.bank_routing_number
    fill_in "Can emcee", with: @user.can_emcee
    fill_in "Can lead band", with: @user.can_lead_band
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Email", with: @user.email
    fill_in "Has battery generator", with: @user.has_battery_generator
    fill_in "Has car", with: @user.has_car
    fill_in "Has lighting system", with: @user.has_lighting_system
    fill_in "Has sound system", with: @user.has_sound_system
    fill_in "Meal prefference", with: @user.meal_prefference
    fill_in "Name on bank account", with: @user.name_on_bank_account
    fill_in "Nick name", with: @user.nick_name
    fill_in "Passport birth date", with: @user.passport_birth_date
    fill_in "Passport city of birth", with: @user.passport_city_of_birth
    fill_in "Passport country of birth", with: @user.passport_country_of_birth
    fill_in "Passport date issued", with: @user.passport_date_issued
    fill_in "Passport expiration", with: @user.passport_expiration
    fill_in "Passport first name", with: @user.passport_first_name
    fill_in "Passport last name", with: @user.passport_last_name
    fill_in "Passport nationality", with: @user.passport_nationality
    fill_in "Passport number", with: @user.passport_number
    fill_in "Passport state of birth", with: @user.passport_state_of_birth
    fill_in "Password digest", with: @user.password_digest
    fill_in "Phone", with: @user.phone
    fill_in "Preferred first name", with: @user.preferred_first_name
    fill_in "Preferred last name", with: @user.preferred_last_name
    fill_in "Primary instrument", with: @user.primary_instrument
    fill_in "Secondary instrument", with: @user.secondary_instrument
    fill_in "Song list", with: @user.song_list
    fill_in "Staff notes", with: @user.staff_notes
    fill_in "Staff rating", with: @user.staff_rating
    fill_in "State", with: @user.state
    fill_in "Tax address1", with: @user.tax_address1
    fill_in "Tax address2", with: @user.tax_address2
    fill_in "Tax city", with: @user.tax_city
    fill_in "Tax country", with: @user.tax_country
    fill_in "Tax first name", with: @user.tax_first_name
    fill_in "Tax id number", with: @user.tax_id_number
    fill_in "Tax last name", with: @user.tax_last_name
    fill_in "Tax state", with: @user.tax_state
    fill_in "Tax zip", with: @user.tax_zip
    fill_in "Tertiary instrument", with: @user.tertiary_instrument
    fill_in "Will play ceremonies", with: @user.will_play_ceremonies
    fill_in "Will play fever events", with: @user.will_play_fever_events
    fill_in "Will play wedding receptions", with: @user.will_play_wedding_receptions
    fill_in "Will travel international", with: @user.will_travel_international
    fill_in "Will travel overnight", with: @user.will_travel_overnight
    fill_in "Zip", with: @user.zip
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
