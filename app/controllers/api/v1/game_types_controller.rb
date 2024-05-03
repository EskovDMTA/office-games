class Api::V1::GameTypesController < Api::V1::ApplicationController
  before_action :set_game_type, only: %i[show destroy update]
  before_action :authorize_game_type, only: %i[destroy update]
  def index
    @games_types = GameType.all
    if @games_types
      render format: :json
    else
      render json: { error: 'Genres not found' }, status: :not_found
    end
  end

  def show
    if @game_type
      render format: :json
    else
      render json: { error: 'Genre not found' }, status: :not_found
    end
  end

  def create
    game_type = GameType.create!(game_type_params)
    render json: { message: "#{game_type.name} отправлен на модерацию" }, status: :created
  rescue => e
    render json: { error: "Произошла ошибка при сохранении записи:#{e.message}" }, status: :unprocessable_entity
  end

  def destroy
    authorize_game_type
    @game_type = GameType.find(params[:id])
    @game_type.destroy
    render json: { message: "#{@game_type.name} удален" }, status: :ok
  end

  def update
    if @game_type.update(game_type_params)
      render json: {message: "Жанр успешно обновлен"}, status: :ok
    else
      render json: {error: @game_type.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def set_game_type
    @game_type = GameType.find(params[:id])
  end

  def authorize_game_type
    authorize @game_type
  end

  def game_type_params
    params.require(:game_type).permit(:name, :description)
  end
end
