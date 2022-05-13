class TrainingsController < ApplicationController
    before_action :set_training, only: %i[ show edit update destroy ]
    respond_to :html, :xml, :json
    def index
      @programs = Program.all.order("created_at DESC")
      @marketing = MarketingSection.all.order("created_at DESC")
      @departments = Department.all.order("created_at DESC")
    end
  
    
    def show
      @programs = Training.find(params[:id])
      @marketing = MarketingSection.all.order("created_at DESC")
      @trainingList = TrainingList.all.order("created_at DESC")
    end
  
    def new
      @training = Training.new
    end
  
    def edit
    end
  
    def create
      @training = Training.new(training_params)
  
      respond_to do |format|
        if @training.save
          format.html { redirect_to @training, notice: "Training was successfully created." }
          format.json { render :show, status: :created, location: @training }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @training.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /programs/1 or /programs/1.json
    def update
      respond_to do |format|
        if @training.update(training_params)
          format.html { redirect_to @training, notice: "Training was successfully updated." }
          format.json { render :show, status: :ok, location: @training }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @training.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /programs/1 or /programs/1.json
    def destroy
      @training.destroy
      respond_to do |format|
        format.html { redirect_to trainings_url, notice: "Training was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_training
        @training = Training.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def training_params
        params.fetch(:training, {})
      end
  end
  