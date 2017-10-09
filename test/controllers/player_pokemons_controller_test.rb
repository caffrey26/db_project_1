require 'test_helper'

class PlayerPokemonsControllerTest < ActionController::TestCase
  setup do
    @player_pokemon = player_pokemons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_pokemons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_pokemon" do
    assert_difference('PlayerPokemon.count') do
      post :create, player_pokemon: { player_id: @player_pokemon.player_id, pokemon_id: @player_pokemon.pokemon_id }
    end

    assert_redirected_to player_pokemon_path(assigns(:player_pokemon))
  end

  test "should show player_pokemon" do
    get :show, id: @player_pokemon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_pokemon
    assert_response :success
  end

  test "should update player_pokemon" do
    patch :update, id: @player_pokemon, player_pokemon: { player_id: @player_pokemon.player_id, pokemon_id: @player_pokemon.pokemon_id }
    assert_redirected_to player_pokemon_path(assigns(:player_pokemon))
  end

  test "should destroy player_pokemon" do
    assert_difference('PlayerPokemon.count', -1) do
      delete :destroy, id: @player_pokemon
    end

    assert_redirected_to player_pokemons_path
  end
end
