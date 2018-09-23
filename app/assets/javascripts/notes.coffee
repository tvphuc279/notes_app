@Note=
  manageNote: ->
    note_editor = CKEDITOR.instances.note_content_edt
    note_editor.on 'blur', () ->
      $('.note-form #note_content').val(note_editor.getData())
      $('.note-form').submit()
  
  setContent: (content) ->
    CKEDITOR.instances.note_content_edt.setData(content)
  
  handleEditNote: (note_id) ->    
    @clearSelectedNote()
    @setNoteSelected(note_id)
 
  handleNewNote: (note_id) ->
    @clearSelectedNote()
    @setNoteSelected(note_id)
  
  clearSelectedNote: ->
    $('.note-title').removeClass('active-note')
  
  setNoteSelected: (note_id) ->
    $('.note-title').each (index) ->      
      if parseInt($(this).data('id')) == parseInt(note_id)
        $(this).addClass('active-note')
      else
        $(this).removeClass('active-note')
    
  
  