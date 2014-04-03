class TagsController < ApplicationController
  def new
     @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])

    if @tag.save
      flash[:notice] = "Your tag was added to tag"
      redirect_to("/tags")
    else
      @messages = []
      @tag.errors.full_messages.each do |message|
        @messages << message
      end
      flash[:alert] = "Errors: #{@messages.join(", ")}"
      render("tags/new.html.erb")
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render('tags/show.html.erb')
  end

  def edit
    @tag = Tag.find(params[:id])
    render('tags/edit.html.erb')
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(params[:tag])
      flash[:notice] = "Your tag was updated."
      redirect_to("/tags/#{@tag.id}")
    else
      @messages = []
      @tag.errors.full_messages.each do |message|
        @messages << message
      end
      flash[:alert] = "Errors: #{@messages.join(", ")}"
      render("tags/edit.html.erb")
    end
  end

  def destroy
     @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to('/tags')
  end

  def index
    @tags = Tag.all
    render :index
  end
end
