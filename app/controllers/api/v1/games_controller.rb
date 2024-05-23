class Api::V1::GamesController < Api::V1::ApplicationController
  before_action :set_game, only: %i[show destroy update]
  before_action :authorize_game, only: %i[destroy update]
  def index
    @games = Game.all
    if @games
      render format: :json
    else
      render json: { error: 'Игры не найдены' }, status: :not_found
    end
  end

  def show
    if @game
      render format: :json
    else
      render json: { error: 'Игра не найдена' }, status: :not_found
    end
  end

  def create
    @game = Game.create!(game_params)
    render json: { message: "#{@game.name} отправлен на модерацию" }, status: :created
  rescue => e
    render json: { error: "Произошла ошибка при сохранении записи:#{e.message}" }, status: :unprocessable_entity
  end

  def destroy
    authorize_game
    @game.destroy
    render json: { message: "#{@game.name} удален" }, status: :ok
  end

  def update
    if @game.update(game_params)
      render json: {message: "Жанр успешно обновлен"}, status: :ok
    else
      render json: {error: @game.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def authorize_game
    authorize @game
  end

  def game_params
    params.require(:game).permit(:name, :description, :game_type_id)
  end

end
