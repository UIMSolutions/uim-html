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
	O metas(this O)(string[string] value, string[string][] addMetas...) { this.metas(H5Meta(value)).metas(addMeta); return cast(O)this;}
	O metas(this O)(string[string][] addMetas) { foreach(addMeta; addMetas) this.metas(H5Meta(addMeta)); return cast(O)this; }

	O metas(this O)(DH5Meta[] addMetas...) { this.metas(addMetas); return cast(O)this; }
	O metas(this O)(DH5Meta[] addMetas) { _metas ~= addMetas; return cast(O)this;}

	O clearMetas(this O)() { _metas = null; return cast(O)this; }
	unittest {
		/// TODO
	}

	DH5Link[] _styles;
	DH5Link[] styles() { return  _styles; }	
	O styles(this O)(string link, string[] links...) { this.styles([link]~links); return cast(O)this;}
	O styles(this O)(string[] links) { foreach(link; links) this.styles(H5Link(link)); return cast(O)this;}

	O styles(this O)(string[string] link, string[string] links...) { this.styles([link]~links); return cast(O)this;}
	O styles(this O)(string[string][] links) { foreach(link; links) this.styles(H5Link(link)); return cast(O)this;}

	O styles(this O)(DH5Link[] links...) { this.styles(links); return cast(O)this;}
	O styles(this O)(DH5Link[] links) { _styles ~= links; return cast(O)this;}

	O clearStyles(this O)() { _styles = null; return cast(O)this; }
	unittest {
		/// TODO
	}

	DH5Script[] _libraries;
	DH5Script[] libraries() { return _libraries; }
	O libraries(this O)(string lib, string[] libs...) { this.libraries([lib]~libs); return cast(O)this;}
	O libraries(this O)(string[] libs) { foreach(lib; libs) this.libraries(H5Link(libs)); return cast(O)this;}

	O libraries(this O)(string[string] lib, string[string] libs...) { this.libraries([lib]~libs); return cast(O)this;}
	O libraries(this O)(string[string][] libs) { foreach(lib; libs) this.libraries(H5Link(lib)); return cast(O)this;}

	O libraries(this O)(DH5Script[] libs...) { this.libraries(libs); return cast(O)this;}
	O libraries(this O)(DH5Script[] libs) { libraries ~= libs; return cast(O)this;}

	O clearLibraries(this O)() { _libs = null; return cast(O)this; }
	unittest {
		// assert(H5AppLayout.)
	}

xx	mixin(XString!("headPart"));
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
			parameters["title"] =  this.lang;
			if (page) parameters["title"] = page.lang; 
		}

		if ("lang" !in parameters) {
			parameters["lang"] =  this.lang;
			if (page) parameters["lang"] = page.lang; 
		}

		if ("metas" !in parameters) parameters["metas"] = "";
		parameters["metas"] = this.metas.toString ~ (page ? page.metas.toString:"") ~ parameters["metas"];

		if ("styles" !in parameters) parameters["styles"] = "";
		parameters["styles"] = this.styles.toString ~ (page ? page.styles.toString:"") ~ parameters["styles"];

		if ("libraries" !in parameters) parameters["libraries"] = "";
		parameters["libraries"] = this.libraries.toString ~ (page ? page.libraries.toString:"") ~ parameters["libraries"];

		return toString(page.content, parameters);
	}

	string toString(string content, string[string] parameters = null) {
		auto finalLang = parameters.get("lang", this.lang); // if lang !in parameters use this.lang
		auto finalTitle = parameters.get("title", this.title);  // if title !in parameters use this.title

		auto finalMetas = (this.metas ? this.metas.toString:""); // First layout metas (if exists)
		finalMetas ~= parameters.get("metas", ""); // second metas in parameters (if exists)

		auto finalLibraries = (this.libraries ? this.libraries.toString:""); // First layout libraries (if exists)
		finalLibraries ~= parameters.get("libraries", ""); // second libraries in parameters (if exists)

		auto finalStyles = (this.styles ? this.styles.toString:""); // First layout styles (if exists)
		finalStyles ~= parameters.get("styles", ""); // second styles in parameters (if exists)

		// creating HTML page
		auto result = H5Html
		.attributes("lang", finalLang).attributes("dir", ("dir" in parameters ? parameters["dir"] : "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(finalMetas)
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(finalStyles)
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, this.parameters) : content)
		.body_(finalLibraries);

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
	/*assert(H5AppLayout()() == `<!doctype html><html lang="en"><html><head></head><body></body></html>`);
	assert(H5AppLayout()(null, ["lang":"de"]) == `<!doctype html><html lang="de"><html><head></head><body></body></html>`);
	assert(H5AppLayout()("---") == `<!doctype html><html lang="en"><html><head></head><body>---</body></html>`);
	assert(H5AppLayout().preContent("123").postContent("xyz")("---", ["lang":"de"]) == `<!doctype html><html lang="de"><html><head></head><body>123---xyz</body></html>`);
/*	assert(H5AppLayout.toString("") == "");
	assert(H5AppLayout()("") == "");
	assert(H5AppLayout.toString("test") == "test");
	assert(H5AppLayout()("test") == "test"): */
}
