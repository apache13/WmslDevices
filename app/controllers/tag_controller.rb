class TagController < ApplicationController
  def print
    @device = Device.find(params[:id])
  end
end
