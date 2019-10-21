class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :basic_auth, if: :production?
    protect_from_forgery with: :exception
  
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name, 
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :birthyear,
        :birthmonth,
        :birthday,
        :mobile_number])
      end

      def header_category 
        @parents = Category.all.where(ancestry: nil)
      end
      
      private
    
      def production?
        Rails.env.production?
      end

      def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
          username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
        end
      end
end
