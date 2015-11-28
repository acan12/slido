initiateCommentAction = () ->
  update_comment_action = ($this) -> 
    content = $("#userComment").val()
    pptId   = $this.attr("ppt")
    $.ajax
      url: "/presentations/"+pptId+"/comments",
      method: 'POST',
      data: { comment: {content: content, presentation_id: pptId}},
      error: () ->
        $("#postcomment .text-error").text("comment failed!")
        console.log("something wrong with your connection!!!")
      success: (html_comment) ->
        $("#sortable").prepend(html_comment)
        $("#userComment").val("")
        
  
  $('.btn-comment').on 'click', (e) ->
    update_comment_action($(this))
  $('#userComment').keypress (e) ->
    update_comment_action($(this)) if e.which == 13
    

$(document).ready initiateCommentAction
