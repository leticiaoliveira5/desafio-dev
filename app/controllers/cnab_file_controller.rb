class CnabFileController < ApplicationController
  before_action :authenticate_user!

  def show
    @cnab_file = CnabFile.find(params[:id])
    @stores = @cnab_file.stores.includes(:transactions)
  end

  def create
    parser = Parser.new(file: params[:file], current_user: current_user)

    if parser.valid? && parser.call
      redirect_to root_path, notice: t('.parser_success')
    else
      redirect_to root_path, alert: t('.parser_failure')
    end
  end

  private

  def cnab_file_params
    params.require(:company).permit(:file, :user)
  end
end
