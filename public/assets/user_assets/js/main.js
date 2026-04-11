
$(function() {
	"use strict";



// Theme switcher 

$("#LightTheme").on("click", function() {
  $("html").attr("class", "light-theme")
}),


$("#DarkTheme").on("click", function() {
$("html").attr("class", "dark-theme")
}),


$(".dark-mode-icon").on("click", function() {

  $(".mode-icon i").toggleClass("bi bi-brightness-high bi bi-moon")
  $("html").toggleClass("dark-theme")
})



/* Back to top */
$(document).ready(function() {
  $(window).on("scroll", function() {
    $(this).scrollTop() > 300 ? $(".back-to-top").fadeIn() : $(".back-to-top").fadeOut()
  }), $(".back-to-top").on("click", function() {
    return $("html, body").animate({
      scrollTop: 0
    }, 600), !1
  })
})


/* list active */
$(function() {
  for (var e = window.location, o = $(".primary-menu li a").filter(function() {
      return this.href == e
    }).addClass("active").parent().addClass("active"); o.is("li");) o = o.parent("").addClass("show").parent("").addClass("active")
})



});

/* for changing tables*/

     var referralButton=document.getElementById("referralteam-button");
     var totalTeamButton=document.getElementById("totalteam-button");
     var referralTable=document.getElementById("refferal-team");
     var totalTeamTable=document.getElementById("total-team");
      
    
    
    document.addEventListener("DOMContentLoaded", function() {
      referralButton.classList.add("active");
      referralTable.style.display="block";
      totalTeamTable.style.display="none";

    });
    totalTeamButton.addEventListener("click", function() {
      referralButton.classList.remove("active");
      totalTeamButton.classList.add("active");
      referralTable.style.display="none";
      totalTeamTable.style.display="block";

    });
     referralButton.addEventListener("click", function() {
       referralButton.classList.add("active");
       totalTeamButton.classList.remove("active");
       referralTable.style.display="block";
       totalTeamTable.style.display="none"
     });


    


