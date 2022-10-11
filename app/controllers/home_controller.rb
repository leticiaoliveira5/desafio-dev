class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def parse_cnab
    return unless params[:file]
    
    parser = Parser.new(file: params[:file], current_user: current_user)

    if parser.valid? && parser.call
      redirect_to root_path, notice: 'Os dados foram carregados com sucesso'
    else
      redirect_to root_path, alert: 'Houve um problema ao parsear o arquivo. Certifique-se de que o arquivo selecionado é válido.'
    end
  end
end
