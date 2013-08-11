$(document).ready ->
  $('.comment-form').each ->
    $this = $(this)
    $textarea = $this.find('textarea')
    $button = $this.find('button')

    $(document).mouseup (e) ->
      if $this.has(e.target).length == 0
        showCommentForm(false)

    showCommentForm = (visible) ->
      if visible
        $textarea.attr('rows', 4)
      else
        $textarea.attr('rows', 1)
      $button.toggle(visible)

    $textarea.focus -> showCommentForm(true)

    if $textarea.val() == ""
      showCommentForm(false)
