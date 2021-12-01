module uim.html.apps;

@safe:
import vibe.d;

// Main
public import uim.html.apps.app;

// Packages
public import uim.html.apps.controllers;
public import uim.html.apps.models;
public import uim.html.apps.views;

// Modules
public import uim.html.apps.appconfig;
public import uim.html.apps.authpage;
public import uim.html.apps.layout;

alias LIBNAME = string;
alias LIBVERSION = string;
alias LIBPATH = string;
alias LIBSTYLE = string;
alias LIBSCRIPT = string;

Json Libraries;
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