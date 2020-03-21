module uim.html.apps.page;

import uim.html;

class DH5AppPage : DH5AppObj {
	this() { super(); this.mimetype("text/html"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

	/// Every page can has his own layout - Otherwise it will use central app layout
	DH5AppLayout _layout;
	auto layout() { 
		if (_layout) return _layout;
		if (_app) if (_app.layout) return _app.layout;
		return null;
	}
	O layout(this O)(DH5AppLayout newlayout) { _layout = newlayout; return cast(O)this; }
	unittest {
		auto ly = H5AppLayout;
		assert(H5AppPage.content("xxx") == "xxx");
		assert(H5AppPage.content("xxx").layout(ly) == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}

	/// Page fragments
	mixin(XStringAA!"fragments");
	unittest {
		assert(H5AppPage.fragments == null);
		assert(H5AppPage.fragments(["x":"y"]).fragments == ["x":"y"]);
		assert(H5AppPage.fragments("x", "y").fragments == ["x":"y"]);
	}

	/// Export to string
	override string toString() {
		// if (_layout) return _layout.toString(this.content, this.parameters);
		// return _content;
		// debug writeln("H5Page: override string toString()");
		if (cached) {
			// debug writeln("Cached");
			if (_toString) return _toString;
			if (this.content) { _toString = (this.layout ? this.layout.toString(this.content, this.parameters) : this.content); return _toString; }
		}
		// Not cached
		// debug writeln("Not Cached");
		debug writeln(this.content);
		if (this.content) { return (this.layout ? this.layout.toString(this.content, this.parameters) : this.content); }
		return _toString;
	}
	unittest {
		writeln(`writeln(H5AppPage)`);
		writeln(H5AppPage);
	}
}
auto H5AppPage() { return new DH5AppPage(); }
auto H5AppPage(string aName) { return new DH5AppPage(aName); }
auto H5AppPage(DH5App anApp) { return new DH5AppPage(anApp); }
auto H5AppPage(DH5App anApp, string aName) { return new DH5AppPage(anApp, aName); }

unittest {
    assert(H5AppPage);
    assert(H5AppPage("name").name() == "name");
    assert(H5AppPage("name").name("newname").name() == "newname");

		auto app = H5App;
	  assert(H5AppPage(app).app == app);
    assert(H5AppPage(app, "name").name == "name");
    assert(H5AppPage(app, "name").app == app);
    assert(H5AppPage(app, "name").name("newname").name() == "newname");
}
