module uim.html.apps.obj;

import uim.html;

class DH5AppObj {
	this() { }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

	/// App of obj
	DH5App _app;
	auto app() { return _app; }
	O app(this O)(DH5App newApp) { _app = newApp; return cast(O)this; }
	unittest {
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

	auto path() { 
		if (_app) return app.rootPath ~ name;
		return "/"~name; }

	/// Mimetype of obj
	string _mimetype;
	auto mimetype() { return _mimetype; }
	O mimetype(this O)(string newMimetype) { _mimetype = newMimetype; return cast(O)this; }
	unittest {
		/// TODO
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
		assert(H5AppPage.parameters == null);
		assert(H5AppPage.parameters(["x":"y"]).parameters == ["x":"y"]);
		assert(H5AppPage.parameters("x", "y").parameters == ["x":"y"]);
	}
	unittest {
		/// TODO
	}

	/// Content of obj
	string _content;
	auto content() { return _content; }
	O content(this O)(string addContent) { _content ~= addContent; _cached = true; return cast(O)this; }
	O clearContent(this O)() { _content = null; _cached = false; return cast(O)this; }
	unittest {
		assert(H5AppObj.content("test").content == "test");
		assert(H5AppObj.content("double").content("test").content == "doubletest");
		assert(H5AppObj.content("double").content("test").clearContent.content == "");
		assert(H5AppObj.content("double").content("test").clearContent.content("test").content == "test");
	}

	/// Response to HTTP request
	void request(HTTPServerRequest req, HTTPServerResponse res) {
		res.writeBody(toString, _mimetype); 
	}
	unittest {
		/// TODO
	}

	string _toString;
	/// Export to string
	override string toString() {
		if (cached) {
			if (!_toString) _toString = this.content; 
			return _toString; 
		}
		return this.content; 
	}
}
auto H5AppObj() { return new DH5AppObj(); }
auto H5AppObj(DH5App anApp) { return new DH5AppObj(anApp); }
auto H5AppObj(string aName) { return new DH5AppObj(aName); }
auto H5AppObj(DH5App anApp, string aName) { return new DH5AppObj(anApp, aName); }
	unittest {
		/// TODO
	}
