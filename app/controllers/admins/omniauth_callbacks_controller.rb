class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token

    def google_oauth2
     
      admin = Admin.from_google(from_google_params)
  
      if admin.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect admin, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_admin_session_path
      end
    end
    def facebook
        admin = Admin.from_google(from_facebook_params)
      if admin.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Facebook'
        sign_in_and_redirect admin, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Facebook', reason: "#{auth.info.email} is not authorized."
        redirect_to new_admin_session_path
      end
    end
    

      def linkedin
        admin = Admin.from_google(from_google_params)
        if admin.present?
          sign_out_all_scopes
          flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Linkedin'
          sign_in_and_redirect admin, event: :authentication
        else
          flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Linkedin', reason: "#{auth.info.email} is not authorized."
          redirect_to new_admin_session_path
        end
      end
      def github
        admin = Admin.from_google(from_github_params)
        if admin.present?
          sign_out_all_scopes
          flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'GitHub'
          sign_in_and_redirect admin, event: :authentication
        else
          flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'GitHub', reason: "#{auth.info.email} is not authorized."
          redirect_to new_admin_session_path
        end
      end


      def twitter
        # abort(from_twitter_params.to_json)
        admin = Admin.from_google(from_twitter_params)
        # redirect_to new_admin_profile_path(admin.id)

        if admin.present?
          sign_out_all_scopes
          flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Twitter'
          sign_in_and_redirect admin , event: :authentication
        else
          flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Twitter', reason: "#{auth.info.email} is not authorized."
          redirect_to new_admin_session_path
        end
      end

    protected
  
    def after_omniauth_failure_path_for(_scope)
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      request.env['omniauth.auth'] = resource_or_scope
      stored_location_for(resource_or_scope) || root_path
    end
  
    private
  
    def from_google_params
      @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end

    def from_github_params
      @from_github_params ||= {
        uid: auth.uid,
        email: auth.info.email==nil ? "#{auth.info.name}@test.com" : auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end
  
    def from_facebook_params

        @from_facebook_params ||= {
          uid: auth.uid,
          email: auth.info.email==nil ? "#{auth.info.name}12a@test.com" : auth.info.email,
          full_name: auth.info.name,
          avatar_url: auth.info.image
        }
      end

      def from_twitter_params
        # abort(auth.to_json)
        @from_twitter_params ||= {
          uid: "1224",
          email: "twiter-test@test.com",#auth.info.email == nil ? "twiter-test@test.com" : auth.info.email,
          full_name: 'test', #auth.info.name == nil ? 'test': auth.info.name ,
          avatar_url: 'test_url', #auth.info.image == nil ? 'test_url' : auth.info.image
        }
      end

    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end