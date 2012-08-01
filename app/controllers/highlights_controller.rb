class HighlightsController < ApplicationController
  before_filter :authorized_user, :only => [:edit, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index ]
  def index
    @highlights = Highlight.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @highlights }
    end
  end
  
  def show
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @highlight }
    end
  end
  
  def new
    @highlight = Highlight.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @highlight }
    end
  end
  
  def edit
     @highlight = Highlight.find(params[:id])
  end
  
  def create
    @highlight = current_user.highlights.build(params[:highlight])

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight, notice: 'Highlight was successfully created.' }
        format.json { render json: @highlight, status: :created, location: @highlight }
      else
        format.html { render action: "new" }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      if @highlight.update_attributes(params[:highlight])
        format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @highlight = Highlight.find(params[:id])
    @highlight.destroy

    respond_to do |format|
      format.html { redirect_to highlights_url }
      format.json { head :no_content }
    end
  end
  
  private
  
    def authorized_user
      @highlight = Highlight.find(params[:id])
      unless @highlight.user_id == current_user.id
        redirect_to highlight_path
      end
    end    
  end
