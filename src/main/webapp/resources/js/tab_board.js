$(function(){

	 $("ul.pboard li:not("+$("ul.tboard li a.selected").attr("href")+")").hide();

	 $("ul.tboard li a").click(function(){

	    $("ul.tboard li a").removeClass("selected1"); 

	    $(this).addClass("selected"); $("ul.pboard li").slideUp("fast"); 

	    $($(this).attr("href")).slideDown("fast"); return false; }); 

	 });