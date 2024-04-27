class Api::V1::GameTypesController < Api::V1::ApplicationController
  def index
    @games_types = GameType.all
    if @games_types
      render format: :json
    else
      render json: { error: 'Genres not found' }, status: :not_found
    end
  end

  def show
    @game_type = GameType.find_by(id: params[:id])
    if @game_type
      render format: :json
    else
      render json: { error: 'Genre not found' }, status: :not_found
    end
  end

  def create
    @game_type = GameType.create!(game_type_params)
    if @game_type.save
      render json: {message: "#{@game_type.name} отправлен на модерацию"}, status: :created
    else
      render json: { error: "#{@game_type.errors.full_messages}" }, status: :not_found
    end
  end

  def destroy
    @game_type = GameType.find(params[:id])
    @game_type.destroy
    render format: :json
  end

  def update
  end

  private

  def game_type_params
    params.require(:game_type).permit(:name, :description)
  end
end
