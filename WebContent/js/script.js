$(function(){
  var $tab = $(".tab_wrap");
  var $tabMenu =$(".tab_menu li");
  $(document).ready(function(){
    if($tab.length > 0){
      $(".tab_menu li a").click(function(){
        var $target =$(this).attr("href");
        $tabMenu.removeClass("on");
        $(this).parent().addClass("on");
        $($target).show();
        $( ".tab_cont" ).not($target).hide();
      //  alert($target)
        return false
      })
    }
  })

  $("#agree").click(function(){
    if($("#agree").prop("checked","true")){
      $(".wauto").toggleClass("on");
    }
  })

})
