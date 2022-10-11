class CnabFileController < ApplicationController
  before_action :authenticate_user!

  def show
    @cnab_file = CnabFile.find(params[:id])
    @stores = cnab_file.stores.includes(:transactions)
  end

  def create(cnab_file_params)
    Parser.new(file: file, user: cnab_file.user)
  end

  private

  def cnab_file_params
    
  end
end