<!DOCTYPE html><!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]--><!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]--><!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]--><!--[if gt IE 8]><!--><html class="no-js"> <head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><title>pgAdmin 4</title><meta name="viewport" content="width=device-width, initial-scale=1"><link rel="shortcut icon" href="/favicon.ico?ver=30200"><link type="text/css" rel="stylesheet" href="/static/vendor/backgrid/backgrid.css?ver=30200"><link type="text/css" rel="stylesheet" href="/browser/browser.css?ver=30200"><link type="text/css" rel="stylesheet" href="/static/js/generated/style.css?ver=30200"><link type="text/css" rel="stylesheet" href="/static/js/generated/pgadmin.css?ver=30200"><link type="text/css" rel="stylesheet" href="/static/css/alertify.noanimation.css?ver=30200" id="alertify-no-animation"><script type="text/javascript" src="/static/vendor/require/require.min.js?ver=30200"></script><script type="text/javascript">
            require.config({
                baseUrl: '',
                urlArgs: 'ver=30200',
                waitSeconds: 0,
                shim: {},
                paths: {
                    sources: "/static/js",
                    slickgrid: "/static/js/generated/slickgrid",
                    codemirror: "/static/js/generated/codemirror",
                    datagrid: "/static/js/generated/datagrid",
                    sqleditor: "/static/js/generated/sqleditor",
                    'pgadmin.browser.utils': "/browser/" + "js/utils",
                    'pgadmin.browser.endpoints': "/browser/" + "js/endpoints",
                    'pgadmin.browser.messages': "/browser/" + "js/messages",
                    'pgadmin.server.supported_servers': "/browser/" + "server/supported_servers",
                    'pgadmin.user_management.current_user': "/user_management/" + "current_user",
                    'translations': "/tools/" + "translations"
                }
            });

    </script><script type="text/javascript" src="/static/js/generated/vendor.js?ver=30200"></script><script type="text/javascript" src="/static/js/generated/pgadmin_commons.js?ver=30200"></script></head> <body> <!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]--> <style>
#pg-spinner {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background: black;
  opacity: 0.6;
  z-index: 1056;
}
#pg-spinner .pg-sp-content {
  position: absolute;
  width: 100%;
  top: 40%;
}
#pg-spinner .pg-sp-icon {
  font-size: 50px;
  text-align: center;
  color: #ccc;
}
#pg-spinner .pg-sp-text {
  font-size: 20px;
  text-align: center;
  color: #fff;
}
.pgadmin_header_logo {
  cursor: default;
}
</style> <div id="pg-spinner"> <div class="pg-sp-content"> <div class="row"><div class="col-xs-12 pg-sp-icon fa fa-spinner fa-pulse"></div></div> <div class="row"><div class="col-xs-12 pg-sp-text">Loading pgAdmin 4 v3.2...</div></div> </div> </div> <nav class="navbar-inverse navbar-fixed-top pg-navbar"> <div class="container-fluid"> <div class="navbar-header"> <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> <a class="navbar-brand pgadmin_header_logo" onclick="return false;" href="#" title="pgAdmin 4 logo"> <i class="app-icon pg-icon"></i> <span>&nbsp;pgAdmin 4</span> </a> </div> <div class="collapse navbar-collapse" id="navbar-menu" role="navigation"> <ul class="nav navbar-nav"> <li id="mnu_file" class="dropdown hide"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">File <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> <li id="mnu_edit" class="dropdown hide"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Edit <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> <li id="mnu_obj" class="dropdown "> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Object <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> <li id="mnu_management" class="dropdown hide"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Management <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> <li id="mnu_tools" class="dropdown hide"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tools <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> <li id="mnu_help" class="dropdown hide"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Help <span class="caret"></span></a> <ul class="dropdown-menu navbar-inverse" role="menu"></ul> </li> </ul> </div> </div> </nav> <div id="dockerContainer" class="pg-docker"></div> <script>
            try {
require(
['sources/generated/app.bundle'],
function() {
},
function() {
/* TODO:: Show proper error dialog */
console.log(arguments);
});
} catch (err) {
/* Show proper error dialog */
console.log(err);
}

/*
 * Show loading spinner till every js module is loaded completely
 * Referenced url:
 * http://stackoverflow.com/questions/15581563/requirejs-load-script-progress
 * Little bit tweaked as per need
 */
require.onResourceLoad = function (context, map, depMaps) {
  var loadingStatusEl = panel = document.getElementById('pg-spinner');
  if (loadingStatusEl) {
    if (!context) {
      // we will call onResourceLoad(false) by ourselves when requirejs
      // is not loading anything hide the indicator and exit
      setTimeout(function() {
        if (panel != null) {
            try{
                $(panel).remove();
            }
            catch(e){
                panel.outerHTML = "";
                delete panel;
            }
          return;
        }
      }, 500);
    }

    // show indicator when any module is loaded and
    // shedule requirejs status (loading/idle) check
    panel.style.display = "";
    clearTimeout(panel.ttimer);
    panel.ttimer = setTimeout(function () {
      var context = require.s.contexts._;
      var inited = true;
      for (name in context.registry) {
        var m = context.registry[name];
        if (m.inited !== true) {
          inited = false;
          break;
        }
      }

      // here the "inited" variable will be true, if requirejs is "idle",
      // false if "loading"
      if (inited) {
        // will fire if module loads in 400ms. TODO: reset this timer
        // for slow module loading
        require.onResourceLoad(false);
      }
    }, 400)
  }
};


</script> </body> </html>