require "test_helper"

class Api::V1::GameTypesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @game_type = game_types(:adventure)
  end

  test "index game_types" do
    get api_v1_game_types_path
    assert_response :ok
  end

  test "show game_type" do
    get api_v1_game_type_path(@game_type)
    response_body = JSON.parse(response.body)
    assert_response :ok
    assert(response_body["genre"], @game_type.name)
  end

  test "should create" do
    post api_v1_game_types_path params: {
      game_type: {
        name: "Arcade",
        description: "Arcade its okay"
      }
    }
    assert_response :created
    game_type = GameType.last
    assert(game_type.name, "Arcade")
    assert(game_type.description, "Arcade its okay")
    assert(game_type.status, 0)
  end

  test "user cannot delete game_types" do
    count_before_delte = GameType.count
    delete api_v1_game_type_path(@game_type)
    assert_response :forbidden
    assert(GameType.count, count_before_delte)
  end
end
