class SnacksController < ApplicationController
  def show
    @machine = Machine.find(params[:id])
    # @snack = Snack.find(params[:id])
  end
end
