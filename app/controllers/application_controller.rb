class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Para que solicite autenticacion de usuario al entrar
  before_action :authenticate_user!
end
