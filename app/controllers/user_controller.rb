class UserController < ApplicationController
  def index
    @customers = Customer.all
  end
end
