class ApplicationController < ActionController::Base
    def current_user
        super
      end
    
      helper_method :current_user
end
