require 'test_helper'

class FightsControllerTest < ActionController::TestCase
  setup do
    @fight = fights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fight" do
    assert_difference('Fight.count') do
      post :create, fight: { challenged_player_id: @fight.challenged_player_id, challenged_pokemon_id: @fight.challenged_pokemon_id, challenger_player_id: @fight.challenger_player_id, challenger_pokemon_id: @fight.challenger_pokemon_id, fight_date: @fight.fight_date, fight_winner: @fight.fight_winner }
    end

    assert_redirected_to fight_path(assigns(:fight))
  end

  test "should show fight" do
    get :show, id: @fight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fight
    assert_response :success
  end

  test "should update fight" do
    patch :update, id: @fight, fight: { challenged_player_id: @fight.challenged_player_id, challenged_pokemon_id: @fight.challenged_pokemon_id, challenger_player_id: @fight.challenger_player_id, challenger_pokemon_id: @fight.challenger_pokemon_id, fight_date: @fight.fight_date, fight_winner: @fight.fight_winner }
    assert_redirected_to fight_path(assigns(:fight))
  end

  test "should destroy fight" do
    assert_difference('Fight.count', -1) do
      delete :destroy, id: @fight
    end

    assert_redirected_to fights_path
  end
end
