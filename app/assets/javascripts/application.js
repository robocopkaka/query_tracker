// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require webcomponentsjs/webcomponents-lite
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require material
//= require turbolinks
//= require materialize-sprockets
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  componentHandler.upgradeDom();
});

function showhide()
 {
       var div = document.getElementById("close_case");
if (div.style.display !== "none") {
    div.style.display = "none";
}
else {
    div.style.display = "block";
}
 }

 function showhide2()
 {
       var div = document.getElementById("reassign_case");
if (div.style.display !== "none") {
    div.style.display = "none";
}
else {
    div.style.display = "block";
}
 }

 function showhide3()
 {
       var div = document.getElementById("reopen_case");
if (div.style.display !== "none") {
    div.style.display = "none";
}
else {
    div.style.display = "block";
}
 }

 function hasClass( target, className ) {
    return new RegExp('(\\s|^)' + className + '(\\s|$)').test(target.className);
}
document.addEventListener('mdl-componentupgraded', function(e) {
        if (hasClass(e.target, 'mdl-layout')) {            
            if (window.location.hash)
                window.location = window.location.hash;
        }
    });