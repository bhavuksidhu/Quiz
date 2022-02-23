class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: %i{upload_question}
  # GET /questions or /questions.json
  def index
    if params[:quiz_id].present?
    @questions = Question.where(quiz_id: params[:quiz_id]).paginate(:page => params[:page], :per_page => 5)
    else
      @questions = Question.all.paginate(:page => params[:page], :per_page => 2)
    end
    render layout: 'dashboaard'

  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_question
    binding.pry
    file = params[:upload_file].tempfile
    all_question=[]
    option_value=[]

    answer_keys=["a"=>0,"b"=>1,"c"=>2,"d"=>3,"e"=>4,"f"=>5]
    index=-1
    option_no=1
    data=File.foreach(file).map { |line|
      if line.include? "QUES"
        option_no=1
        option_value=[]
        index=index+1
        all_question[index]={}
        all_question[index]['quiz_id']=params[:quiz_id]
      line= line.split('.')
        all_question[index]['question']=line[1].gsub(/\s+/, ' ')
      else
        if line.include? "("
          if line.include? "उत्तर"
            key=line.gsub(/\s+/, ' ').gsub('(','').gsub(')','').split('-').last.strip
            all_question[index]["correct_answer"]= option_value[answer_keys[0]["#{key}"]]
            option_no= option_no+1
          else
            option_value << line.gsub(/\s+/, ' ').split(')').last.strip
            all_question[index]["options"]=option_value
            option_no= option_no+1
          end
        end
      end  
    }  

    questions=Question.import all_question
    redirect_to questions_path(quiz_id: 1), notice: "Questions Created Successfully"
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :options, :correct_answer, :quiz_id)
    end
end
