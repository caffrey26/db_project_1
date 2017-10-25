class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  # GET /fights
  # GET /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
    @players =Player.joins(:player_pokemons).distinct
  end

  # GET /fights/1/edit
  def edit
  end
  
  
  def challenger_pokemon
    @player1 = params[:challenger][:challenger_player_id]
    @pokemons = Player.find(params[:challenger][:challenger_player_id]).pokemons
  end


  def challenged_player
    @players =Player.joins(:player_pokemons).distinct

    @players2 = @players.where.not(id: params[:player1_id])
   
    @player1 = params[:player1_id]
    @pokemon1 = params[:pokemon][:challenger_pokemon_id]
    # params[:player1_id] = params[:players1_id]
    # params[:pokemon1_id] = params[:pokemon][:challenger_pokemon_id]
  end
  
  def challenged_pokemon
    @player1 = params[:player1_id]
    @pokemon1 = params[:pokemon1_id]
    @player2 = params[:challenged][:challenged_player_id]
    
    @pokemons = Player.find(@player2).pokemons

    # params[:player1_id] = params[:players1_id]
    # params[:pokemon1_id] = params[:pokemon][:challenger_pokemon_id]
  end
  
  def create_fight
    @player1 = params[:player1_id]
    @pokemon1 = params[:pokemon1_id]
    @player2 = params[:player2_id]
    @pokemon2= params[:pokemon2][:challenged_pokemon_id]
    @fight = Fight.new
    @winner = [@player1,@player2]; 
    # params[:player1_id] = params[:players1_id]
    # params[:pokemon1_id] = params[:pokemon][:challenger_pokemon_id]
  end
  
  
  
  # POST /fights
  # POST /fights.json
  def create
    params[:fight_date] = params[:fight][:fight_date]
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save
        p = Player.find(params[:fight_winner])
        p.increment!(:win_count)
        format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
        format.json { render :show, status: :created, location: @fight }
      else
        format.html { render :new }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fights/1
  # PATCH/PUT /fights/1.json
  def update
    respond_to do |format|
      if @fight.update(fight_params)
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { render :show, status: :ok, location: @fight }
      else
        format.html { render :edit }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1
  # DELETE /fights/1.json
  def destroy
    p = Player.find(@fight.fight_winner)
    @fight.destroy
    p.decrement!(:win_count)
    respond_to do |format|
      format.html { redirect_to fights_url, notice: 'Fight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fight_params
      params.permit(:challenger_player_id, :challenger_pokemon_id, :challenged_player_id, :challenged_pokemon_id, :fight_date, :fight_winner)
    end
end
