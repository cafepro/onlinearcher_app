// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.fittext
//= require wow.min
//= require jquery.easing.min
//= require classie
//= require cbpAnimatedHeader
//= require bootstrap
//= require creative
//= require_tree .

var app_history = [];

function fix_links(host, _req){
  $('a[href^="/"]').each(function(){
    $(this).attr('href', 'http://' + host + $(this).attr('href'));
  });
  $('form[action^="/"]').each(function(){
    $(this).attr('action', 'http://' + host + $(this).attr('action'));
  });
    
  var _full_req = 'http://'+host+_req;
  if (!_full_req.includes(".js")){
    if (_full_req.includes("?")){
      _full_req = _full_req.replace('?','.js?')
    } else {
      _full_req += '.js'
    }
  }
  if (app_history.length==0 || app_history[0]!=_full_req) app_history.unshift(_full_req);
  if (app_history.length>10) app_history.pop();
  
  history.pushState("Title", "Title", _req);

}