class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    
byebug
# Tell the UserMailer to send a welcome email after save
    UserMailer.with(user: @user).welcome_email.deliver_now
    UserMailer.with(user: @user).welcome_email.deliver_later
byebug

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:band_area_1, :band_area_2, :band_area_3, :band_area_4, :band_area_5, :band_area_6, :band_area_7, :band_area_8, :band_area_9, :preferred_first_name, :preferred_last_name, :nick_name, :email, :phone, :address1, :address2, :city, :state, :zip, :country, :password_digest, :staff_rating, :staff_notes, :tax_first_name, :tax_last_name, :tax_address1, :tax_address2, :tax_city, :tax_state, :tax_zip, :tax_country, :tax_id_number, :name_on_bank_account, :bank_routing_number, :bank_account_number, :primary_instrument, :secondary_instrument, :tertiary_instrument, :song_list, :has_car, :has_sound_system, :has_lighting_system, :has_battery_generator, :will_play_fever_events, :will_play_wedding_receptions, :will_play_ceremonies, :will_travel_overnight, :will_travel_international, :can_emcee, :can_lead_band, :meal_prefference, :passport_number, :passport_expiration, :passport_date_issued, :passport_first_name, :passport_last_name, :passport_birth_date, :passport_city_of_birth, :passport_state_of_birth, :passport_country_of_birth, :passport_nationality)
    end
end
