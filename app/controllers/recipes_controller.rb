class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      flash[:notice] = "Your recipe was added to Recipe"
      redirect_to("/recipes")
    else
      @messages = []
      @recipe.errors.full_messages.each do |message|
        @messages << message
      end
      messages = @messages.join(", ")
      flash[:alert] = "Errors: #{messages}"
      render("recipes/new.html.erb")
    end
  end
end
