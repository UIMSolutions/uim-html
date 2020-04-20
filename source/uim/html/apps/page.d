module uim.html.apps.page;

import uim.html;

class DH5AppPage : DH5AppObj {
	this() { super(); this.mimetype("text/html"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

	/// Language of page
	string _lang = "en";
	/// Get language of page
	string lang() { return _lang; }
	string language() { return _lang; }
	/// Change language of page
	O lang(this O)(string newLang) { _lang = newLang; return cast(O)this; }
	O language(this O)(string newLang) { _lang = newLang; return cast(O)this; }
	unittest {		
			assert(H5App.lang("aLanguage").lang == "aLanguage");	
			assert(H5App.lang("aLanguage").lang("otherLanguage").lang == "otherLanguage");
			assert(H5App.language("aLanguage").language == "aLanguage");	
			assert(H5App.language("aLanguage").language("otherLanguage").language == "otherLanguage");
	}

	/// Every page can has his own layout - Otherwise it will use central app layout
	DH5AppLayout _layout;
	auto layout() { 
		if (_layout) return _layout;
		if (_app) if (_app.layout) return _app.layout;
		return null;
	}
	O layout(this O)(DH5AppLayout newlayout) { _layout = newlayout; return cast(O)this; }
	unittest {
		//auto ly = H5AppLayout;
		//assert(H5AppPage.content("xxx") == "xxx");
		//assert(H5AppPage.content("xxx").layout(ly) == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}

	string[] _metas;
	string[] metas() { return _metas; }
	O metas(this O)(string value, string[] addMetas...) { this.meta(value); foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this;}
	O metas(this O)(string[] addMetas) { foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this;}
	O metas(this O)(DH5Meta[] addMetas) { foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this;}
	O metas(this O)(DH5Meta[] addMetas...) { foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this;}
	O metas(this O)(string[string] value, string[string][] addMetas...) { this.meta(value); foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this;}
	O metas(this O)(string[string][] addMetas) { foreach(addMeta; addMetas) this.meta(addMeta); return cast(O)this; }

	O meta(this O)(string[string] addValues) { this.meta(H5Meta(addValues)); return cast(O)this; }
	O meta(this O)(DH5Meta addMeta) { _metas ~= addMeta.toString; return cast(O)this; }

	O clearMetas(this O)() { _metas = null; return cast(O)this; }
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

	string[] _styles;
	string[] styles() { return  _styles; }
	O styles(this O)(DH5Link link, DH5Link[] links...) { this.style(link).styles(links); return cast(O)this;}
	O styles(this O)(DH5Link[] links) { foreach(link; links) this.style(link); return cast(O)this;}
	O styles(this O)(string link, string[] links...) { this.style(link).styles(links); return cast(O)this;}
	O styles(this O)(string[] links) { foreach(link; links) this.style(link); return cast(O)this;}

	O style(this O)(string link) { this.style(H5Link(["href":link, "rel":"stylesheet"])); return cast(O)this;}
	O style(this O)(DH5Link link) { _styles ~= link.toString; return cast(O)this;}

	unittest {
		/// TODO
	}

	mixin(XString!("css"));

	string[] _libraries;
	string[] libraries() { return _libraries; }
	O libraries(this O)(string link, string[] links...) { this.library(link).libraries(links); return cast(O)this;}
	O libraries(this O)(string[] links) { foreach(l; links) this.library(l); return cast(O)this;}

	O library(this O)(string link) { this.library(H5Script(["src":link])); return cast(O)this; }
	O library(this O)(DH5Script link) { _libraries ~= link.toString; return cast(O)this; }
	unittest {
		// assert(H5AppLayout.)
	}

	mixin(XString!("script"));
	
	/// Export to string
	override string toString() {
		// if (_layout) return _layout.toString(this.content, this.parameters);
		// return _content;
		// // debug // writeln("H5Page: override string toString()");
		if (cached) {
			// // debug // writeln("Cached");
			if (_toString) return _toString;
			if (this.content) { _toString = (this.layout ? this.layout.toString(this, this.parameters) : this.content); return _toString; }
		}
		// Not cached
		// // debug // writeln("Not Cached");
		// // debug // writeln(this.content);
		if (this.content) { return (this.layout ? this.layout.toString(this, this.parameters) : this.content); }
		return _toString;
	}
	unittest {
		//// writeln(`// writeln(H5AppPage)`);
		//// writeln(H5AppPage);
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
