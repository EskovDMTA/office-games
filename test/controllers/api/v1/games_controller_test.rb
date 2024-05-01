require "test_helper"

class Api::V1::GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @game = games(:one)
    @game_type = game_types(:adventure)
  end

  test "index games" do
    get api_v1_games_path
    assert_response :ok
  end

  test "show game" do
    get api_v1_game_path(@game)
    response_body = JSON.parse(response.body)
    assert_response :ok
    assert(response_body["name"], @game.name)
  end

  test "should create games" do
    post api_v1_games_path, params: { game: {
      name: "Avengers",
      description: "Tanos vs avengers",
      game_type_id: @game_type.id
    }}
    assert_response :created
    assert(Game.last.name, "Avengers")
    assert(Game.last.status,0)
  end

  test "user cannot delete game" do
    delete api_v1_game_path(@game.id)
    assert_response :forbidden
  end

  test "user cannot update game_types" do
    patch api_v1_game_path(@game), params: { game: {
      name: "Updated"
    }}
    assert_response :forbidden
  end
end
