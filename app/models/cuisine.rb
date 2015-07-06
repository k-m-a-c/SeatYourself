class Cuisine < ActiveRecord::Base
  has_and_belongs_to_many :restaurants

  def index
    @cuisines = Cuisine.find.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      flash[:notice] = "You created a new type of cuisine."
      redirect_to cuisines_url
    else
      flash[:alert] = "Woops. Looks like that didn't save."
      render :new
    end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
