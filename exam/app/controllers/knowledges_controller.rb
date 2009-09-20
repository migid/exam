class KnowledgesController < ApplicationController
  # GET /knowledges
  # GET /knowledges.xml
  def index
    @knowledges = Knowledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knowledges }
    end
  end

  # GET /knowledges/1
  # GET /knowledges/1.xml
  def show
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knowledge }
    end
  end

  # GET /knowledges/new
  # GET /knowledges/new.xml
  def new
    @knowledge = Knowledge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knowledge }
    end
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
  end

  # POST /knowledges
  # POST /knowledges.xml
  def create
    @knowledge = Knowledge.new(params[:knowledge])

    respond_to do |format|
      if @knowledge.save
        flash[:notice] = 'Knowledge was successfully created.'
        format.html { redirect_to(@knowledge) }
        format.xml  { render :xml => @knowledge, :status => :created, :location => @knowledge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knowledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knowledges/1
  # PUT /knowledges/1.xml
  def update
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      if @knowledge.update_attributes(params[:knowledge])
        flash[:notice] = 'Knowledge was successfully updated.'
        format.html { redirect_to(@knowledge) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knowledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges/1
  # DELETE /knowledges/1.xml
  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy

    respond_to do |format|
      format.html { redirect_to(knowledges_url) }
      format.xml  { head :ok }
    end
  end
end
