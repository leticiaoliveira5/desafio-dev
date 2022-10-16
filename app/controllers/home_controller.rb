class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @cnabs = current_user.cnab_files
  end
end
