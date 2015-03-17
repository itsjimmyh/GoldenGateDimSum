// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require pace.min
//= require jquery_ujs
//= require jquery.serializejson.min
//= require bootstrap.min
//= require underscore
//= require backbone
//= require ggDimSum
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./utils
//= require_tree ./views
//= require_tree ./routers
//= require_tree .


(function () {
  console.log('Hello from your friendly web developer:  --> www.itsjimmyh.com <--');

  // figure out how to use Pace.track ( 'jquery.ajax event' );
  // then we don't have to wrap all ajax calls with Pace.track
  
  // $(document).ajaxStart(function (event) {
  //   console.log(event);
  //   console.log(event.function);
  //   Pace.track(function () {
  //   });
  // });

  // $(document).ajaxSend(function ( event, request, settings ) {
  //   console.log(event);
  //   console.log(request);
  //   console.log(settings);
  //   Pace.track(function () {
  //
  //   });
  // })

})();
