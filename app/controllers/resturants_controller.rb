class ResturantsController < ApplicationController
  before_action :set_resturant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  before_action :check_user, except: [:search, :index, :show]

  def search
    if params[:search].present?
      @resturants = Resturant.search(params[:search])
    else
      @resturants = Resturant.all
    end
  end

# GET /resturants
  # GET /resturants.json
  def index
    @resturants = Resturant.all
  end

  # GET /resturants/1
  # GET /resturants/1.json
  def show
    @reviews = Review.where(resturant_id: @resturant.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /resturants/new
  def new
    @resturant = Resturant.new
  end

  # GET /resturants/1/edit
  def edit
  end

  # POST /resturants
  # POST /resturants.json
  def create
    @resturant = Resturant.new(resturant_params)

    respond_to do |format|
      if @resturant.save
        format.html { redirect_to @resturant, notice: 'Resturant was successfully created.' }
        format.json { render :show, status: :created, location: @resturant }
      else
        format.html { render :new }
        format.json { render json: @resturant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resturants/1
  # PATCH/PUT /resturants/1.json
  def update
    respond_to do |format|
      if @resturant.update(resturant_params)
        format.html { redirect_to @resturant, notice: 'Resturant was successfully updated.' }
        format.json { render :show, status: :ok, location: @resturant }
      else
        format.html { render :edit }
        format.json { render json: @resturant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resturants/1
  # DELETE /resturants/1.json
  def destroy
    @resturant.destroy
    respond_to do |format|
      format.html { redirect_to resturants_url, notice: 'Resturant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resturant
      @resturant = Resturant.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resturant_params
      params.require(:resturant).permit(:name, :address, :phone, :website, :image)
    end
end
