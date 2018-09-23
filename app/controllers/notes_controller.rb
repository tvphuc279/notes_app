class NotesController < ApplicationController
  before_action :get_note, only: [:edit, :update]
  
  def index
    @notes = Note.where(user_id: current_user.id).order(:title)
    @default_note = @notes.first
  end
  
  def create
    @note = Note.new(permitted_params)
    unless @note.title.present?
      notes_count = Note.all.count
      @note.title = I18n.t('note.titles.new_note') + " #{notes_count}"
    end
    @note.user_id = current_user.id
    if @note.save
      @edit_note_url = edit_note_path(@note)
    end
  end
  
  def edit
  end
  
  def update
    @note.update_attributes(permitted_params)
  end
  
  private
    def permitted_params
      params.require(:note).permit(:title, :content)
    end
  
    def get_note
      @note = Note.find_by(id: params[:id])  
    end 
end
