class DifficultiesController < ApplicationController
  # GET /difficulties
  # GET /difficulties.xml
  def index
    @difficulties = Difficulty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @difficulties }
    end
  end

  # GET /difficulties/1
  # GET /difficulties/1.xml
  def show
    @difficulty = Difficulty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @difficulty }
    end
  end

  # GET /difficulties/new
  # GET /difficulties/new.xml
  def new
    @difficulty = Difficulty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @difficulty }
    end
  end

  # GET /difficulties/1/edit
  def edit
    @difficulty = Difficulty.find(params[:id])
  end

  # POST /difficulties
  # POST /difficulties.xml
  def create
    @difficulty = Difficulty.new(params[:difficulty])

    respond_to do |format|
      if @difficulty.save
        flash[:notice] = 'Difficulty was successfully created.'
        format.html { redirect_to(@difficulty) }
        format.xml  { render :xml => @difficulty, :status => :created, :location => @difficulty }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @difficulty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /difficulties/1
  # PUT /difficulties/1.xml
  def update
    @difficulty = Difficulty.find(params[:id])

    respond_to do |format|
      if @difficulty.update_attributes(params[:difficulty])
        flash[:notice] = 'Difficulty was successfully updated.'
        format.html { redirect_to(@difficulty) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @difficulty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /difficulties/1
  # DELETE /difficulties/1.xml
  def destroy
    @difficulty = Difficulty.find(params[:id])
    @difficulty.destroy

    respond_to do |format|
      format.html { redirect_to(difficulties_url) }
      format.xml  { head :ok }
    end
  end
end
