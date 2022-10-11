class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def parse_cnab
    return unless params[:file]
    
    Parser.new(file: params[:file], current_user: current_user).call
  end
end
