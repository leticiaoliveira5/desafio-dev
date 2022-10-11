class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def parse_cnab
    return unless params[:file]

    parser = Parser.new(file: params[:file], current_user: current_user)

    if parser.valid? && parser.call
      redirect_to root_path, notice: t('.parser_success')
    else
      redirect_to root_path, alert: t('.parser_failure')
    end
  end
end
