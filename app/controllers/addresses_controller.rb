class AddressesController < ApplicationController
  def edit
    @prefectures = Prefecture.all
  end

  def update
  end
end
