$(document).ready ->
  $track_info_form = $('#track_info_form')
  
  if $('#track_artist').val() == "" && $('#track_title').val() == ""
    $track_info_form.hide()

  cleanStr = (str) ->
    tokens = str.split('_')
    upper = (t.charAt(0).toUpperCase() + t.slice(1) for t in tokens)
    return upper.join(' ').trim()

  $('#track_midi_file').change ->
    $track_info_form.show()
    filename = $('#track_midi_file').val().split('/').pop().split('\\').pop()
    filename = filename.split('.mid')[0]

    [artist, title] = (cleanStr(str) for str in filename.split('-'))

    $('#track_artist').val artist
    $('#track_title').val title
