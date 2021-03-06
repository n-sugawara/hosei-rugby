class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /players
  # GET /players.json
  def index
    @players = Player.find_by(position: "LO")
    @sidetopics = Topic.order(data: :desc)
    @sideresults = Result.order(time: :desc)
    @pr = Player.where(position: "PR")
    @ho = Player.where(position: "HO")
    @lo = Player.where(position: "LO")
    @fl = Player.where(position: "FL")
    @no8 = Player.where(position: "NO.8")
    @sh = Player.where(position: "SH")
    @so = Player.where(position: "SO")
    @ctb = Player.where(position: "CTB")
    @wtb = Player.where(position: "WTB")
    @fb = Player.where(position: "FB")
    @manager = Player.where(position: "マネージャー")
    @rehuri = Player.where(position: "学生レフリー")
    @coach = Player.where(position: "COACH")
    @staff = Player.where(position: "STAFF")
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @sidetopics = Topic.order(data: :desc)
    @sideresults = Result.order(time: :desc)
  end

  # GET /players/new
  def new
    @player = Player.new
    @sideresults = Result.order(time: :desc)
  end

  # GET /players/1/edit
  def edit
    @sideresults = Result.order(time: :desc)
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :yomi, :position, :height, :weight, :gakubu, :gakunen, :highscool, :career, :image, :comment)
    end
end
