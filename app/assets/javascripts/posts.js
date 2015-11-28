$(function(){
  $("#share").click(function(){
    permalink = $(this).attr("permalink");
    clipboard.copy(permalink);
    alert("copylink: "+permalink)
  });
  
  $("#like").click(function(){
    ppt = $(this).attr("ppt");
    $.ajax({
      url: "/presentations/"+ppt+"/ajax_like",
      method: "POST",
      error: function(){
        console.log("errror!")
      },
      success: function(data){
        // update likes count  
        $("#like-text").text(data.count + " likes");
        
        if(data.status)
          $("#like").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
        else
          $("#like").removeClass("glyphicon-heart").addClass("glyphicon-heart-empty");
        

        console.log("done!!") 
      }
    })
  });
})