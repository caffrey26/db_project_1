class PlayerPokemonsController < ApplicationController
  before_action :set_player_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /player_pokemons
  # GET /player_pokemons.json
  def index
     
    @player_pokemons = PlayerPokemon.all
  end

  # GET /player_pokemons/1
  # GET /player_pokemons/1.json
  def show
  end

  # GET /player_pokemons/new
  def new
    @player_pokemon = PlayerPokemon.new
  end

  # GET /player_pokemons/1/edit
  def edit
  end

  # POST /player_pokemons
  # POST /player_pokemons.json
  def createpk
    @player_pokemon = PlayerPokemon.new(player_pokemon_params)

    respond_to do |format|
      if @player_pokemon.save
        format.html { redirect_to @player_pokemon, notice: 'Player pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @player_pokemon }
      else
        format.html { render :new }
        format.json { render json: @player_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_pokemons/1
  # PATCH/PUT /player_pokemons/1.json
  def update
    respond_to do |format|
      if @player_pokemon.update(player_pokemon_params)
        format.html { redirect_to @player_pokemon, notice: 'Player pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_pokemon }
      else
        format.html { render :edit }
        format.json { render json: @player_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_pokemons/1
  # DELETE /player_pokemons/1.json
  def destroy
    @player_pokemon.destroy
    respond_to do |format|
      format.html { redirect_to player_pokemons_url, notice: 'Player pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_pokemon
      @player_pokemon = PlayerPokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_pokemon_params
      params.permit(:player_id, :pokemon_id)
    end
end
