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
		if (_app.layout) return _app.layout;
		return null;
	}
	O layout(this O)(DH5AppLayout newlayout) { _layout = newlayout; return cast(O)this; };
	unittest {
		/// TODO		
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
		if (cached) {
			if (_toString) return _toString;
			if (this.content) { _toString = (this.layout ? this.layout.toString(this.content, this.parameters) : this.content); return _toString; }
		}
		string result;
		if (cached) { _toString = result; return _toString; }
		return result; 
	}
}
auto H5AppPage() { return new DH5AppPage(); }
auto H5AppPage(string aName) { return new DH5AppPage(aName); }
auto H5AppPage(DH5App anApp) { return new DH5AppPage(anApp); }
auto H5AppPage(DH5App anApp, string aName) { return new DH5AppPage(anApp, aName); }

unittest {
    assert(H5AppPage);
}
