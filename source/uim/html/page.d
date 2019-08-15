module uim.html.page;

import uim.html;

class DH5Page {
    this() {}
    this(DH5App anApp) { this(); _app = anApp; }
	this(string aName) { this(); _name = aName; }
	this(DH5App anApp, string aName) { this(anApp); _name = aName; }

	string function(string, string[string]) _layout;
	@property layout(this O)(string function(string, string[string]) func) { _layout = func; return cast(O)this; }

	mixin(TProperty!("DH5App", "app"));

	mixin(TProperty!("string", "name"));
	unittest {
		assert(H5Page("test").name == "test");
		assert(H5Page.name("test").name == "test");
	}
    mixin(TProperty!("string", "content"));
	mixin(TProperty!("string[string]", "parameters"));
	mixin(TProperty!("string[string]", "components"));

	void request(HTTPServerRequest req, HTTPServerResponse res) {
		if (_layout) res.writeBody(_layout(toString, parameters), "text/html");
		else res.writeBody(toString, "text/html");
	}
	override string toString() {
		return (_content) ? _content : "";
	}
}
auto H5Page() { return new DH5Page(); }
auto H5Page(string aName) { return new DH5Page(aName); }
auto H5Page(DH5App anApp) { return new DH5Page(anApp); }
auto H5Page(DH5App anApp, string aName) { return new DH5Page(anApp, aName); }

unittest {
    assert(H5Page);
}
