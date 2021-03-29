class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :action_before_is_login, except: [:index, :new, :create, :logout]
end