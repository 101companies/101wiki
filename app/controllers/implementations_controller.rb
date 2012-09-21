class ImplementationsController < ApplicationController
  # GET /implementations
  # GET /implementations.json
  def index
    @implementations = Implementation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @implementations }
    end
  end

  # GET /implementations/1
  # GET /implementations/1.json
  def show
    @implementation = Implementation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @implementation }
    end
  end

  # GET /implementations/new
  # GET /implementations/new.json
  def new
    @implementation = Implementation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @implementation }
    end
  end

  # GET /implementations/1/edit
  def edit
    @implementation = Implementation.find(params[:id])
  end

  # POST /implementations
  # POST /implementations.json
  def create
    @implementation = Implementation.new(params[:implementation])

    respond_to do |format|
      if @implementation.save
        format.html { redirect_to @implementation, notice: 'Implementation was successfully created.' }
        format.json { render json: @implementation, status: :created, location: @implementation }
      else
        format.html { render action: "new" }
        format.json { render json: @implementation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /implementations/1
  # PUT /implementations/1.json
  def update
    @implementation = Implementation.find(params[:id])

    respond_to do |format|
      if @implementation.update_attributes(params[:implementation])
        format.html { redirect_to @implementation, notice: 'Implementation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @implementation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implementations/1
  # DELETE /implementations/1.json
  def destroy
    @implementation = Implementation.find(params[:id])
    @implementation.destroy

    respond_to do |format|
      format.html { redirect_to implementations_url }
      format.json { head :no_content }
    end
  end
end
