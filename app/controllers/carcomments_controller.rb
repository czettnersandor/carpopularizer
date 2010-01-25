class CarcommentsController < ApplicationController

  def show
    @comment = Carcomment.find(params[:id])
  end

end
