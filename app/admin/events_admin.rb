Trestle.resource(:events) do
  
  menu do
    item :events, icon: "fa fa-calendar-o", group: :events
    # item :finances_summary, icon: "fa fa-calendar-o", group: :finances
  end

  # collection do
  #   Event.includes(:primary_contact_full_name)
  # end

  # search do |query|
  #   query ? collection.pg_search(query) : collection
  # end


  # Define custom scopes for the index view
  scope :all, default: true
  scope :inquired, -> { Event.all.where(event_status: "Inquired") }
  scope :tenative, -> { Event.all.where(event_status: "Tentative Booking") }
  scope :awaiting_deposit, -> { Event.all.where(event_status: "Awaiting Deposit") }
  scope :confirmed, -> { Event.all.where(event_status: "Confirmed") }
  scope :green_light, -> { Event.all.where(event_status: "Green Light") }
  scope :completed, -> { Event.all.where(event_status: "Completed") }
  scope :postponed, -> { Event.all.where(event_status: "Postponed") }
  scope :cancelled, -> { Event.all.where(event_status: "Cancelled") }
  scope :cancelled, -> { Event.all.where(event_status: "Cancelled") }



  # Customize the table columns shown on the index view.
  #
  table do
    column :producer, align: :center
    column :event_date, header: "Date", align: :center
    column :primary_contact_full_name, header: "Contact", align: :center
    column :event_type, header: "Type", align: :center
    column :event_status, header: "Status", sort: :event_status, align: :center do |event|
      if event.event_status == "Inquired"
        status_tag(icon("fa fa-question"), :warning)
      
      elsif event.event_status == "Tentative Booking"
        status_tag(icon("fa fa-angle-double-up"), :warning)

      elsif event.event_status == "Awaiting Deposit"
        status_tag(icon("fa fa-search-dollar"), :warning)

      elsif event.event_status == "Confirmed"
        status_tag(icon("fa fa-dollar-sign"), :success)

      elsif event.event_status == "Green Light"
        status_tag(icon("fa fa-check"), :success)

      elsif event.event_status == "Completed"
        status_tag(icon("fa fa-smile"), :success)

      elsif event.event_status == "Postponed"
        status_tag(icon("fa fa-exclamation-triangle"), :danger)

      elsif event.event_status == "Cancelled"
        status_tag(icon("fa fa-ban"), :danger)

      end

      # status_tag(icon("fa fa-check"), :warning) if event.event_status == "Inquired"
      # status_tag(icon("fa fa-check"), :warning) if event.event_status == "Tenative Booking"
      # status_tag(icon("fa fa-check"), :warning) if event.event_status == "Awaiting Deposit"
      # status_tag(icon("fa fa-check"), :success) if event.event_status == "Confirmed"
      # status_tag(icon("fa fa-check"), :success) if event.event_status == "Green Light"
      # status_tag(icon("fa fa-check"), :danger) if event.event_status == "Postponed"
      # status_tag(icon("fa fa-check"), :danger) if event.event_status == "Canceled"
      # status_tag(icon("fa fa-check"), :success) if event.event_status == "Completed"
      
      # status_tag(event.event_status, {
      #   "Inquired" => :warning,
      #   "Tenative Booking" => :warning,
      #   "Awaiting Deposit" => :warning,
      #   "Confirmed" => :success,
      #   "Green Light" => :success,
      #   "Completed" => :success,
      #   "Postponed" => :danger,
      #   "Canceled" => :danger 
      #   })
    end
    # column :event_status, align: :center do |event|
    #   status_tag(icon("fa fa-check"), :success) if event.event_status == "Completed"
    #   status_tag(icon("fa fa-check"), :success) if event.event_status == "Completed"
    # end

    column :city_and_state, header: "Location", align: :center
    column :band_size, align: :center
    column :finances_total_price, header: "Price", align: :center
    column :profit_margin_floor, header: "Margin", align: :center
    # column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |event|
    
    # tab on the event form for financial related things
    tab :event do

      row do
        select(:producer, options_for_select([ "Producer 1", "Producer 2", "Producer 3", "Producer 4", "Producer 5", "Producer 6", "Producer 7", "Producer 8"], selected: event.producer))
      end
      
      row do 
        if event.event_date&.past?
          date_field :event_date, disabled: true
        else
          date_field :event_date
        end
        
        select(:event_type, options_for_select([ "Non-Fever Concert", "Fever Concert", "Wedding", "Corporate", "Birthday", "Showcase", "Other"], selected: event.event_type), label: 'Type')
        
        select(:event_status, options_for_select([ "Inquired", "Tentative Booking", "Awaiting Deposit", "Confirmed", "Green Light", "Completed", "Cancelled", "Postponed"], selected: event.event_status), label: 'Status')
        
        text_field :venue_city, label: 'City'
        text_field :venue_state, label: 'State'
        
      end

      row do
        editor :client_notes
      end
      
    row do 
      col { text_field :primary_contact_first_name, label: 'First Name', placeholder: 'First Name'}
      col { text_field :primary_contact_last_name, label: 'Last Name', placeholder: 'Last Name'}
      col { text_field :primary_contact_phone, label: 'Phone', placeholder: 'Phone'}
      col { text_field :primary_contact_email, label: 'Email', placeholder: 'Email'}
    end
    
    row do 
      col { text_field :secondary_contact_first_name, label: 'First Name', placeholder: 'First Name'}
      col { text_field :secondary_contact_last_name, label: 'Last Name', placeholder: 'Last Name'}
      col { text_field :secondary_contact_phone, label: 'Phone', placeholder: 'Phone'}
      col { text_field :secondary_contact_email, label: 'Email', placeholder: 'Email'}
    end
    
    row do 
      col { text_field :tertiary_contact_first_name, label: 'First Name', placeholder: 'First Name'}
      col { text_field :tertiary_contact_last_name, label: 'Last Name', placeholder: 'Last Name'}
      col { text_field :tertiary_contact_phone, label: 'Phone', placeholder: 'Phone'}
      col { text_field :tertiary_contact_email, label: 'Email', placeholder: 'Email'}
    end
    
    row do
      col { datetime_field :updated_at, readonly: true, label: 'Last update' }
      col { datetime_field :created_at, readonly: true, label: 'Created on' }
    end
  end
  
    # tab on the event form for band related things
    tab :musicians do
      col(sm: 1) { select(:band_size, options_for_select((1..20).map {|i| i}, selected: event.band_size)) }
      

      for i in 0..(event.band_size.to_i - 1)

        row do 
          # col(sm: 2) {"Musician #{i+1}: #{User.find_by_id(event.musician_01 )&.primary_instrument}"}

          col(sm: 2) { collection_select("musician_#{(i+1).to_s.rjust(2, '0')}", User.all, :id, :full_name, include_blank: true, label: "Musician #{i+1}: #{User.find_by(id: (i+1))&.primary_instrument}") }
          
          col(sm: 0.5 ) { mail_to("#{User.find_by(id: (i+1))&.email}", "", "i class" => "fa fa-envelope btn btn-primary rounded-square ml-auto", subject: "The Subject", body: "anemailbody") } 
          
          # col(sm: 0.5) { tel_to(1234567890) } #users_admin_path(i+1)

          # icon('fa fa-phone'), users_admin_path(i+1).html_safe, class: "btn btn-primary rounded-square ml-auto"

          col(sm: 0.5 ) { link_to(icon('fa fa-calendar'), edit_users_admin_path(i+1).html_safe, class: "btn btn-primary rounded-square ml-auto") }
          
          # <i class="fa-solid fa-calendar-lines-pen"></i>
          col(sm: 0.5) { link_to(icon('fa fa-edit'), edit_users_admin_path(i+1).html_safe, class: "btn btn-primary rounded-square ml-auto") }
          
          # col(sm: 2) { link_to icon('fa fa-star'), "Next Page &rarr;".html_safe, class: "btn btn-outline-primary rounded-square ml-auto" }

          col(sm: 1) { text_field("musician_#{(i+1).to_s.rjust(2, '0')}_pay_rate", prepend: "$", label: "Pay rate") }

          col(sm: 2) { select("musician_#{(i+1).to_s.rjust(2, '0')}_invited", options_for_select(["Not Invited", "Invited"], selected: "event.musician_#{(i+1).to_s.rjust(2, '0')}_invited" ), {label: "Invited?"}, {class: "form-select"})}
  
          col(sm: 2) { select("musician_#{(i+1).to_s.rjust(2, '0')}_accepted", options_for_select(["Pending", "Accepted", "Declined"], selected: "event.musician_#{(i+1).to_s.rjust(2, '0')}_accepted" ), {label: "Accepted?"}, {class: "form-select"})}
           
        end

      end



      # row do 
      #   col(sm: 2) { collection_select(:musician_01, User.all, :id, :full_name, include_blank: true, label: "Musician 1: #{User.find_by_id(event.musician_01)&.primary_instrument}") }

      #   col(sm: 1) { text_field :musician_01_pay_rate, prepend: "$" }

      #   col(sm: 2) { select(:musician_01_invited, options_for_select(["Not Invited", "Invited"], selected: event.musician_01_invited), {}, {class: "form-select"})}

      #   col(sm: 2) { select(:musician_01_accepted, options_for_select(["Pending", "Accepted", "Declined"], selected: event.musician_01_accepted))}
         
      # end

      # row do 
      #   col(sm: 2) { collection_select(:musician_02, User.all, :id, :full_name, include_blank: true, label: "Musician 2 : #{User.find_by_id(event.musician_02)&.primary_instrument}") }

      #   col(sm: 1) { text_field :musician_02_pay_rate, prepend: "$" }

      #   col(sm: 2) { select(:musician_02_invited, options_for_select(["Not Invited", "Invited"], selected: event.musician_02_invited), {}, {class: "form-select"})}

      #   col(sm: 2) { select(:musician_02_accepted, options_for_select(["Pending", "Accepted", "Declined"], selected: event.musician_02_accepted))}
         
      # end
      
    end
    
    # tab on the event form for financial related things
    tab :finances do

      row do
        col(sm: 2) { text_field :finances_total_price, label: "Total Quote Price", prepend: "$"}
      end

      row do
        col(sm: 3) { "Est. Tax (8%): " }
        col(sm: 2) { "$#{event.estimated_taxes_at_8_percent.ceil}" }
      end

      row do
        col(sm: 3) { "Band Cost: "}
        col(sm: 2) { "$#{ event.band_cost }"}
      end

      row do
        col(sm: 3) { "Deposit Commission: " }
        col(sm: 2) { "$#{100}" }
      end
      
      row do
        col(sm: 3) { "Completion Commission: "}
        col(sm: 2) { "$#{100 + (event.profit_margin*0.05).floor}" }
      end

      row do
        col(sm: 3) { "Profit Margin: " }
        col(sm: 2) { "$#{event.profit_margin.ceil}"}
      end
      
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
  #   params.require(:event).permit(:name, ...)
  # end
  
end
