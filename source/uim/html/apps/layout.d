module uim.html.apps.layout;

import uim.html;

/// Page layout
 class DH5AppLayout : DH5AppObj {
	this() { super(); 
	_lang = "en"; }
	this(DH5App anApp) { this().app(anApp); }

	string[] _headClasses;
	string[string] _headAttributes;
	string[] _bodyClasses;
	string[string] _bodyAttributes;

	mixin(XString!("preHead"));
	mixin(XString!("postHead"));
	mixin(XString!("preContent"));
	mixin(XString!("postContent"));
	mixin(XStringArray!("requires"));
	
	mixin(OString!("lang"));
	mixin(OString!("title"));
	
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

  mixin(XString!("headPart"));
	mixin(XString!("bodyPart"));

	/// central layout for page
	DH5AppLayout _layout;
	auto layout() { if (_layout) return _layout; return null; }
	O layout(this O)(DH5AppLayout newlayout) { _layout = newlayout.app(this.app); return cast(O)this; }
	unittest {
		/// TODO		
	}

	string opCall() { return toString(); }
	string opCall(DH5AppPage page, string[string] parameters = null) { return toString(page, parameters); }
	string opCall(string content, string[string] parameters = null) { return toString(content, parameters); }
	
	override string toString() { return toString("", null); }
	string toString(DH5AppPage page, string[string] parameters = null) {
		if ("title" !in parameters) {
			parameters["title"] =  this.title;
			if (page) parameters["title"] = page.title; 
		}

		if ("lang" !in parameters) {
			parameters["lang"] =  this.lang;
			if (page) parameters["lang"] = page.lang; 
		}

		if (page) {			
			debug writeln("Reading header settings from page");
			if (page.metas) {
				if ("metas" in parameters) parameters["metas"] = page.metas.asString~parameters["metas"];
				else parameters["metas"] = page.metas.asString;
			}
			if (page.styles) {
				if ("styles" in parameters) parameters["styles"] = page.styles.asString~parameters["styles"];
				else parameters["styles"] = page.styles.asString;
			}
			if (page.libraries) {
				if ("libraries" in parameters) parameters["libraries"] = page.libraries.asString~parameters["libraries"];
				else parameters["libraries"] = page.libraries.asString;
			}
			debug writeln(parameters);
		}
		return toString(page.content, parameters);
	}

	string toString(string content, string[string] parameters = null) {
		debug writeln("Reading header settings from app");
		if (this.app) {			
			if (this.app.metas) {
				if ("metas" in parameters) parameters["metas"] = this.app.metas.asString~parameters["metas"];
				else parameters["metas"] = this.app.metas.asString;
			}
			if (this.app.styles) {
				if ("styles" in parameters) parameters["styles"] = this.app.styles.asString~parameters["styles"];
				else parameters["styles"] = this.app.styles.asString;
			}
			if (this.app.libraries) {
				if ("libraries" in parameters) parameters["libraries"] = this.app.libraries.asString~parameters["libraries"];
				else parameters["libraries"] = this.app.libraries.asString;
			}
			debug writeln(parameters);
		}

		auto finalLang = parameters.get("lang", this.lang); // if lang !in parameters use this.lang
		auto finalTitle = parameters.get("title", this.title);  // if title !in parameters use this.title

		// creating HTML page
		auto result = H5Html
		.attributes("lang", finalLang).attributes("dir", ("dir" in parameters ? parameters["dir"] : "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(this.metas.asString~parameters.get("metas", ""))
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(this.styles.asString~parameters.get("styles", ""))
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, this.parameters) : content)
		.body_(this.libraries.asString~parameters.get("libraries", ""));

		return result.toString;
	}
	unittest {
		writeln(H5AppLayout);
		assert(H5AppLayout == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {

}
