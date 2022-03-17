Trestle.resource(:users) do

  menu do
    item :band_1, icon: "fa fa-user", group: :musicians
    # item :band_2, icon: "fa fa-user", group: :users
    # item :band_3, icon: "fa fa-user", group: :users
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :preferred_first_name, align: :center
    column :preferred_last_name, align: :center
    column :primary_instrument, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |user|

    tab :name_and_contact_info, badge: "fa-solid fa-id-card" do

      row do
        col(sm: 2) {text_field :preferred_first_name, label: "First Name"}
        col(sm: 2) {text_field :preferred_last_name, label: "Last Name"}
      end
      
      row do
        col(sm: 3) {text_field :address1, label: "Street Address"}
        col(sm: 3) {text_field :address2, label: "Apt. Num."}
      end

      row do
        col(sm: 3) {text_field :city, label: "City"}

        # add an array of states to a method
        col(sm: 1) {select(:state, options_for_select(
          [ "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
          ]), label: "State")}
        col(sm: 3) {text_field :zip, label: "Zip"}
        col(sm: 3) {text_field :country, label: "Country"}
      end

      row do
        col(sm: 3) {email_field :email, label: "Email"}
        col(sm: 3) {telephone_field :phone, label: "Phone" }
      end

    end

    tab :staff_info do

      col(sm: 2) { select(:staff_rating, options_for_select([
        "1 - Great",
        "2 - Good",
        "3 - Ok",
        "4 - Trainable",
        "5 - Not Ready",
        "6 - Bad",
        "7 - Blacklist",
        "8 - Doesn't want gigs"
          ]), label: "Staff Rating")}
      col(sm: 10) { text_area :staff_notes, label: "Staff Notes" }

      row do
        col(sm: 6) { datetime_field :updated_at, readonly: true, label: 'Last update' }
        col(sm: 6) { datetime_field :created_at, readonly: true, label: 'Added on' }
      end
  
    end

    tab :tax_info do
  
    end

    tab :banking_info do
  
    end

    tab :meal_preferences do
  
    end

    tab :instruments_and_skills do
      # text_field :primary_instrument
  
      # col(sm: 10) { text_area :staff_notes, label: "Staff Notes" }

      col(sm: 3) { select(:primary_instrument, options_for_select([
        "Keys",
        "Bass",
        "Drums",
        "Guitar",
        "Male Vocals",
        "Female Vocals",
        "Saxophone",
        "Trumpet",
        "Trombone"], selected: user.primary_instrument), {}, {class: "form-select"})
      }

    end
    # Date.strptime(e.event_date.to_datetime, '%A%d/%m/%y')


    tab :gigs, badge: Event.all.where(musician_01: user.id).count do

      # tab :seasons, badge: tv_show.seasons.count do

      # table do
      #   column :preferred_first_name, align: :center

      # end


      Event.all.where(musician_01: user.id).map do |event| 

        # { e.event_date }

        col(sm: 12) { "
          #{event.event_date.to_date.strftime('%a, %B %d, %Y')} - 
          #{event.primary_contact_first_name} #{event.primary_contact_last_name} - 
          #{event.event_status} - 
          #{event.primary_contact_email} - 
          #{event.primary_contact_phone} - 
          #{event.city_and_state}
        " }

        col(sm: 6) { link_to(icon('fa fa-edit'), events_admin_path(event.id), class: "btn btn-primary rounded-square ml-auto") }

      end 
    
      # link_to(icon('fa fa-calendar'), edit_users_admin_path(i+1).html_safe, class: "btn btn-primary rounded-square ml-auto")

      # row do
      #   col(sm: 6) { Event.all.where(musician_01: 1).map do 
      #     |e| e.event_date.to_date
      #   end 
      # }
        # col(sm: 6) { user.events.where(musician_01: user.id) }
      # end

    end




  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:user).permit(:name, ...)
  # end
  
end