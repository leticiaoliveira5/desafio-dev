class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = current_user.stores.includes(:transactions)
  end
end
