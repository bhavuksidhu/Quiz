class Admins::SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token

    def after_sign_out_path_for(_resource_or_scope)
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end

    def sign_up_with_credentials
      adminparams= {full_name: params[:full_name],email: params[:email], phone_number: params[:phone_number], password: params[:password]}
      admin=Admin.sign_up_with_credentials(adminparams)
      sign_in_and_redirect admin , event: :authentication
    end

    def sign_in_with_credentials
      admin = Admin.find_for_database_authentication(params[:login])
      unless admin.nil?
        if admin.authenticate(params[:password])
          sign_in_and_redirect admin , event: :authentication
        else
          redirect_to request.referer, notice: "Wrong User Name or Password"
        end
      else
        redirect_to request.referer, notice: "Wrong User Name or Password"
      end
    end

    def register
    end
    
  end