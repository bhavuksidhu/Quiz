class FileUploadQuestionsController < ApplicationController
  before_action :set_file_upload_question, only: %i[ show edit update destroy ]

  # GET /file_upload_questions or /file_upload_questions.json
  def index

    @file_upload_questions = FileUploadQuestion.all
    render layout: 'dashboaard'

  end

  # GET /file_upload_questions/1 or /file_upload_questions/1.json
  def show
  end

  # GET /file_upload_questions/new
  def new

    @file_upload_question = FileUploadQuestion.new
    render layout: 'dashboaard'

  end

  # GET /file_upload_questions/1/edit
  def edit
  end

  # POST /file_upload_questions or /file_upload_questions.json
  def create
    @file_upload_question = FileUploadQuestion.new(file_upload_question_params)

    respond_to do |format|
      if @file_upload_question.save
        format.html { redirect_to file_upload_question_url(@file_upload_question), notice: "File upload question was successfully created." }
        format.json { render :show, status: :created, location: @file_upload_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_upload_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_upload_questions/1 or /file_upload_questions/1.json
  def update
    respond_to do |format|
      if @file_upload_question.update(file_upload_question_params)
        format.html { redirect_to file_upload_question_url(@file_upload_question), notice: "File upload question was successfully updated." }
        format.json { render :show, status: :ok, location: @file_upload_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_upload_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_upload_questions/1 or /file_upload_questions/1.json
  def destroy
    @file_upload_question.destroy

    respond_to do |format|
      format.html { redirect_to file_upload_questions_url, notice: "File upload question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_upload_question
      @file_upload_question = FileUploadQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_upload_question_params
      params.require(:file_upload_question).permit(:name)
    end
end
