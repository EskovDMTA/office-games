class Api::V1::Tournaments::BracketsController < ApplicationController
  def generate
  end

  private
  def bracket_params
    params.require(:bracket).permit(:bracket_type)
  end
end
