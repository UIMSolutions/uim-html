module uim.html.apps.controllers.controller;

@safe:
import uim.html;

class DH5AppController {
	this() { 
		this
    .htmlModes(["*"])
		.created(DateTime(2017, 1, 1, 1, 1, 1))
		.changed(DateTime(2017, 1, 1, 1, 1, 1))
		.view(H5NullView); }

	this(string myName) { 
		this().name(myName);
	}

	this(DH5AppView myView) { 
		this().view(myView);
	}

	SysTime _accessTime, _modificationTime;
		
	// bool opEquals(string txt) { return toString == txt; }

	O sourceFile(this O)(string path) { 	
		std.file.getTimes(path, _accessTime, _modificationTime);
		return cast(O)this; }
	unittest {
		version(uim_html) {
			// TODO
			}}

	/**
	* app 
	* 
	* Property which contains the (parent) app
	* DH5App app() - return app if exists
	* (this O) app(DH5App newApp) - setting new app / returns obj
	* 
	* Adding this obj to another app will changes this property to the new app 
	**/
	mixin(OProperty!("DH5App", "app"));
	mixin(OProperty!("DH5AppView", "view"));
	mixin(OProperty!("DH5AppController", "controller")); // Cascading controllers
	mixin(OProperty!("DH5AppControllerComponent[]", "components")); // Cascading controllers

	unittest {
		version(uim_html) {
/* 			assert(H5AppController(H5App("test")).app.name == "test");
			assert(H5AppController(H5App("test")).app(H5App("test2")).app.name == "test2");
 */			}}

	// name - name of controller
	mixin(OProperty!("string", "name"));
	unittest {
		version(uim_html) {
			assert(H5AppController("test").name == "test");
			assert(H5AppController.name("test").name == "test");
			}}

	mixin(OProperty!("string[]", "htmlModes"));

	mixin(OProperty!("DateTime", "created"));
	O created(this O)(SysTime value) { this.created(cast(DateTime)value); return cast(O)this; }
	unittest {
		version(uim_html) {
			// TODO
			}}

	mixin(OProperty!("DateTime", "changed"));
	O changed(this O)(SysTime value) { this.changed(cast(DateTime)value); return cast(O)this; }
	unittest {
		version(uim_html) {
			// TODO
			}}


	auto path() { 
		if (_app) return app.rootPath ~ name;
		return "/"~name; }

	/// Mimetype of obj
	string _mimetype;
	auto mimetype() { return _mimetype; }
	O mimetype(this O)(string newMimetype) { _mimetype = newMimetype; return cast(O)this; }
	unittest {
		assert(H5AppController.mimetype("text/xml").mimetype == "text/xml");
		assert(H5AppController.mimetype("text/xml").mimetype("applications/javascript").mimetype == "applications/javascript");
	}

	/// Name of obj
	bool _cached;
	auto cached() { return _cached; }
	O cached(this O)(bool newcached) { _cached = newcached; return cast(O)this; }
	unittest {
		version(uim_html) {
			// TODO
			}}

	/// Page parameters - will be used to communicate between components
	mixin(XStringAA!"parameters");
	unittest {
		assert(H5AppController.parameters == null);
		assert(H5AppController.parameters(["x":"y"]).parameters == ["x":"y"]);
		assert(H5AppController.parameters("x", "y").parameters == ["x":"y"]);
	}

	/// Response to HTTP request
	HTTPServerRequest _request;
	HTTPServerResponse _response;
	void request(HTTPServerRequest req, HTTPServerResponse res) {
		_request = req;
		_response = res;
		STRINGAA reqParameters = readRequestParameters(req, parameters.dup);
    reqParameters["htmlMode"] = to!string(req.method);

    if (this.htmlModes != ["*"]) {
      foreach(htmlMode; this.htmlModes) {
        if ((req.method == HTTPMethod.GET) && (!canFind(this.htmlModes, "get"))) { res.statusCode = 404; res.writeBody("Not available", _mimetype); }
        else if ((req.method == HTTPMethod.POST) && (!canFind(this.htmlModes, "post"))) { res.statusCode = 404; res.writeBody("Not available", _mimetype); }
        else if ((req.method == HTTPMethod.PUT) && (!canFind(this.htmlModes, "put"))) { res.statusCode = 404; res.writeBody("Not available", _mimetype); }        
        else if ((req.method == HTTPMethod.DELETE) && (!canFind(this.htmlModes, "delete"))) { res.statusCode = 404; res.writeBody("Not available", _mimetype); } 
        else { res.statusCode = 404; res.writeBody("Not available", _mimetype); } 
      }
    }
 
    if (app) {
      with(app) {          
        reqParameters["peer"] = req.peer;
        readSessionId(req, reqParameters);            
        }}
	  request(req, res, reqParameters);
  }
	unittest {
		version(uim_html) {
			/// TODO
	}}

	protected string _responseResult;
	void beforeResponse(STRINGAA options = null) {
		debugMethodCall(moduleName!DH5AppController~":DH5AppController::beforeResponse");
		foreach(k, v; this.parameters) if (k !in options) options[k] = v;
    options["htmlMode"] = to!string(_request.method);

		if ("redirect" in options) return; 
 }
	unittest {
		version(uim_html) {
			/// TODO
	}}

	void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
		debugMethodCall(moduleName!DH5AppController~":DH5AppController::request(req, res, reqParameters)");
		_request = req; _response = res;
		beforeResponse(reqParameters);

		if ("redirect" in reqParameters) {
      debug writeln("Found redirect to ", reqParameters["redirect"]);
      auto redirect = reqParameters["redirect"]; 
      reqParameters.remove("redirect");
      res.redirect(redirect);
    } 

    debug writeln("view = '"~view.name~"'");
		debug writeln("_responseResult = '"~_responseResult~"'");
		debug writeln("_mimetype = '"~_mimetype~"'");
		res.writeBody(_responseResult, _mimetype); }
	unittest {
		version(uim_html) {
			/// TODO
	}}

	//deprecated("Will be removed in 2022")
/* 	string _toString;
	/// Export to string
	override string toString() { string[string] pm; return toString(pm); }
	string toString(STRINGAA reqParameters) {
		debug writeln("parameters in DH5AppController/toString => ", reqParameters); 
		
		debug writeln("Is cached?");
		if (cached) {
			debug writeln("Yes, is cached");
			if (_toString.empty) _toString = this.content(reqParameters); 
			return _toString; 
		}

		debug writeln("Is not cached");
		return this.content(reqParameters); 
	}
	unittest {
		assert(H5AppController.content("test").toString == "test");
		assert(H5AppController.content("double").content("test").toString == "doubletest");
		assert(H5AppController.content("double").content("test").clearContent.toString == "");
		assert(H5AppController.content("double").content("test").clearContent.content("test").toString == "test");
	} */
}
auto H5AppController() { return new DH5AppController(); }
auto H5AppController(string myName) { return new DH5AppController(myName); }
auto H5AppController(DH5AppView myView) { return new DH5AppController(myView); }

unittest {
	version(uim_html) {
		assert(H5AppController.view.name == "H5NullView"); // Controller has default view
		assert(H5AppController.view(H5AppView).view.name == "H5AppView"); // Controller has new view
}}
