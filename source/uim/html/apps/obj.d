module uim.html.apps.obj;

import uim.html;

class DH5AppObj {
	this() { 
		this
		.created(DateTime(2017, 1, 1, 1, 1, 1))
		.changed(DateTime(2017, 1, 1, 1, 1, 1)); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

	SysTime _accessTime, _modificationTime;
	string[] _htmlModes = ["*"];
		
	bool opEquals(string txt) { return toString == txt; }

	O sourceFile(this O)(string path) { 	
		std.file.getTimes(path, _accessTime, _modificationTime);
		return cast(O)this; }
	
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
	unittest {
		assert(H5AppPage(H5App("test")).app.name == "test");
		assert(H5AppPage(H5App("test")).app(H5App("test2")).app.name == "test2");
	}

	/**
	 * name - string that represents the name of the application
	 */
	protected string _name;
	auto name() { return _name; } 
	O name(this O)(string newName) { _name = newName; return cast(O)this; }
	unittest {
		assert(H5AppPage("test").name == "test");
		assert(H5AppPage.name("test").name == "test");
	}

	protected DateTime _created;
	auto created() { return _created; }
	O created(this O)(DateTime value) { _created = value; return cast(O)this; }
	unittest {
		// TODO
	}

	protected DateTime _changed;
	auto changed() { return _changed; }
	O changed(this O)(DateTime value) { _changed = value; return cast(O)this; }
	unittest {
		// TODO
	}

	auto path() { 
		if (_app) return app.rootPath ~ name;
		return "/"~name; }

	/// Mimetype of obj
	string _mimetype;
	auto mimetype() { return _mimetype; }
	O mimetype(this O)(string newMimetype) { _mimetype = newMimetype; return cast(O)this; }
	unittest {
		assert(H5AppObj.mimetype("text/xml").mimetype == "text/xml");
		assert(H5AppObj.mimetype("text/xml").mimetype("applications/javascript").mimetype == "applications/javascript");
	}

	/// Name of obj
	bool _cached;
	auto cached() { return _cached; }
	O cached(this O)(bool newcached) { _cached = newcached; return cast(O)this; }
	unittest {
		/// TODO
	}

	/// Page parameters - will be used to communicate between components
	mixin(XStringAA!"parameters");
	unittest {
		assert(H5AppObj.parameters == null);
		assert(H5AppObj.parameters(["x":"y"]).parameters == ["x":"y"]);
		assert(H5AppObj.parameters("x", "y").parameters == ["x":"y"]);
	}

	/// Content of obj
	string _content;
	string content() { 
		// // debug // writeln("H5AppObj: string content()");
		return _content; }
	O content(this O)(DH5Obj[] addContent) { foreach(c; addContent) _content ~= c.toString; return cast(O)this; }
	O content(this O)(DH5Obj[] addContent...) { foreach(c; addContent) _content ~= c.toString; return cast(O)this; }
	O content(this O)(string addContent) { _content ~= addContent; return cast(O)this; }
	O clearContent(this O)() { _content = null; return cast(O)this; }
	unittest {
		assert(H5AppObj.content("test").content == "test");
		assert(H5AppObj.content("double").content("test").content == "doubletest");
		assert(H5AppObj.content("double").content("test").clearContent.content == "");
		assert(H5AppObj.content("double").content("test").clearContent.content("test").content == "test");
	}

	/// Response to HTTP request
	void request(HTTPServerRequest req, HTTPServerResponse res, string[string] parameters = null) {
		// debug // writeln("H5AppObj: void request()");
		string[string] requestParameters;
		if (this.app) foreach(k, v; this.app.parameters) requestParameters[k] = v;
		foreach(k, v; this.parameters) requestParameters[k] = v;
		foreach(k, v; parameters) requestParameters[k] = v;

		res.writeBody(toString(requestParameters), _mimetype); 
	}
	unittest {
		/// TODO
	}

	string _toString;
	/// Export to string
	override string toString() { string[string] pm; return toString(pm); }
	string toString(string[string] parameters) {
		debug writeln("H5AppObj: override string toString()");
		debug writeln("Content...", this.content);
		
		debug writeln("Is cached?");
		if (cached) {
			debug writeln("Yes, is cached");
			if (_toString.length == 0) _toString = this.content; 
			return _toString; 
		}

		debug writeln("Is not cached");
		return this.content; 
	}
	unittest {
		assert(H5AppObj.content("test").toString == "test");
		assert(H5AppObj.content("double").content("test").toString == "doubletest");
		assert(H5AppObj.content("double").content("test").clearContent.toString == "");
		assert(H5AppObj.content("double").content("test").clearContent.content("test").toString == "test");
	}
}
auto H5AppObj() { return new DH5AppObj(); }
auto H5AppObj(DH5App anApp) { return new DH5AppObj(anApp); }
auto H5AppObj(string aName) { return new DH5AppObj(aName); }
auto H5AppObj(DH5App anApp, string aName) { return new DH5AppObj(anApp, aName); }

unittest {
	/// TODO
}
