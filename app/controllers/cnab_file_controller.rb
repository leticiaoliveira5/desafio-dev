class CnabFileController < ApplicationController
  before_action :authenticate_user!

  def show
    @cnab_file = CnabFile.find(params[:id])
    @stores = @cnab_file.stores.includes(:transactions)
  end

  def create
    data = ParseFileService.new(file: params[:file]).call
    cnab_file = PersistDataService.new(data: data, user: current_user).call

    if cnab_file
      redirect_to cnab_file_path(cnab_file), notice: I18n.t('parser.success')
    else
      redirect_to root_path, alert: I18n.t('parser.failure')
    end
  end
end
