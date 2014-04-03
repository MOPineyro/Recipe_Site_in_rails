class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @search = params[:query]
    if @search == nil
      render('recipes/index.html.erb')
    else
      @search_results = Recipe.basic_search(@search)

      render :index

    end
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
    # FIXME Create method that adds tag_id and recipe_id into join table from recipe#create
    @tag = Tag.create(params[:tag])

    if @recipe.save
      flash[:notice] = "Your recipe was added to Recipe"
      redirect_to("/recipes")
    else
      @messages = []
      @recipe.errors.full_messages.each do |message|
        @messages << message
      end
      flash[:alert] = "Errors: #{@messages.join(", ")}"
      render("recipes/new.html.erb")
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')

  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      flash[:notice] = "Your recipe was updated."
      redirect_to("/recipes/#{@recipe.id}")
    else
      @messages = []
      @recipe.errors.full_messages.each do |message|
        @messages << message
      end
      flash[:alert] = "Errors: #{@messages.join(", ")}"
      render("recipes/edit.html.erb")
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to('/recipes')
  end

end
