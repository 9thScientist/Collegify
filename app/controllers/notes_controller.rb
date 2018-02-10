class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])
    @notes = @topic.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])
    @note = Note.new(note_params)
    @note.topic = @topic

    respond_to do |format|
      if @note.save
        format.html { redirect_to course_topic_note_path(@course, @topic, @note), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @course = Course.find(params[:course_id])
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to course_topic_note_path, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to course_topic_notes_path, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :points, :description, :topic_id)
    end
end
