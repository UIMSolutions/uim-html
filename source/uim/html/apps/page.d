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

	mixin(OString!("title"));
	
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

	protected DH5Meta[] _metas;
	DH5Meta[] metas() { return _metas; }
	O metas(this O)(string[string] value, string[string][] addMetas...) { this.metas([value]~addMetas); return cast(O)this;}
	O metas(this O)(string[string][] addMetas) { foreach(meta; addMetas) this.metas(H5Meta(meta)); return cast(O)this; }

	O metas(this O)(DH5Meta[] addMetas...) { this.metas(addMetas); return cast(O)this; }
	O metas(this O)(DH5Meta[] addMetas) { _metas ~= addMetas; return cast(O)this;}

	O clearMetas(this O)() { _metas = null; return cast(O)this; }
	unittest {
		assert(uim.html.elements.meta.toString(H5AppLayout.metas(["a":"b"]).metas)  == `<meta a="b">`);
		assert(uim.html.elements.meta.toString(H5AppLayout.metas([["a":"b"]]).metas)  == `<meta a="b">`);
		assert(uim.html.elements.meta.toString(H5AppLayout.metas(H5Meta(["a":"b"])).metas)  == `<meta a="b">`);
		assert(uim.html.elements.meta.toString(H5AppLayout.metas([H5Meta(["a":"b"])]).metas)  == `<meta a="b">`);
	}

	DH5Obj[] _styles;
	DH5Obj[] styles() { return  _styles; }	
	O styles(this O)(string content, string[] contents...) { this.styles([content]~contents); return cast(O)this; } // <style>...</style>
	O styles(this O)(string[] links) { foreach(link; links) _styles ~= H5Style(content); return cast(O)this;}

	O styles(this O)(string[string] link, string[string][] links...) { this.styles([link]~links); return cast(O)this;}
	O styles(this O)(string[string][] links) { foreach(link; links) _styles ~= H5Link(link); return cast(O)this;}

	O styles(this O)(DH5Style[] styles...) { this.styles(styles); return cast(O)this;}
	O styles(this O)(DH5Style[] styles) { _styles ~= styles; return cast(O)this;}
	O styles(this O)(DH5Link[] links...) { this.styles(links); return cast(O)this;}
	O styles(this O)(DH5Link[] links) { _styles ~= links; return cast(O)this;}

	O clearStyles(this O)() { _styles = null; return cast(O)this; }
	unittest {
		/// TODO
	}

	DH5Script[] _libraries;
	DH5Script[] libraries() { return _libraries; }
	O libraries(this O)(string lib, string[] libs...) { this.libraries([lib]~libs); return cast(O)this;}
	O libraries(this O)(string[] libs) { foreach(lib; libs) _libraries ~= H5Script(["src":lib]); return cast(O)this;}

	O libraries(this O)(string[string] lib, string[string][] libs...) { this.libraries([lib]~libs); return cast(O)this;}
	O libraries(this O)(string[string][] libs) { foreach(lib; libs) _libraries ~= H5Script(lib); return cast(O)this;}

	O libraries(this O)(DH5Script[] libs...) { this.libraries(libs); return cast(O)this;}
	O libraries(this O)(DH5Script[] libs) { _libraries ~= libs; return cast(O)this;}

	O clearLibraries(this O)() { _libraries = null; return cast(O)this; }
	unittest {
		// assert(H5AppLayout.)
	}
	
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
