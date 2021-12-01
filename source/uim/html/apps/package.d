module uim.html.apps;

import vibe.d;

public import uim.html.apps.app;
public import uim.html.apps.appconfig;
public import uim.html.apps.data;
public import uim.html.apps.image;
// public import uim.html.apps.helpers;
public import uim.html.apps.layout;
public import uim.html.apps.manifest;
public import uim.html.apps.obj;
public import uim.html.apps.page;
public import uim.html.apps.script;
public import uim.html.apps.style;

alias LIBNAME = string;
alias LIBVERSION = string;
alias LIBPATH = string;
alias LIBSTYLE = string;
alias LIBSCRIPT = string;

Json Libraries;
@safe: 
static this() {
  Libraries = parseJsonString(`
  {
    "bootstrap" : { "4.4.1": { "css": "css/bootstrap.css", "js": "js/bootstrap.js"} }, 
    "jquery" : { "3.4.1": { "css": null, "js": "jquery-3.4.1.min.js"} },
    "popper " : { "1.16.0": { "css": null, "js": "popper.js"} }
  }
  `);
}
unittest {
  import std.stdio;
  // writeln(Libraries.toPrettyString);
}