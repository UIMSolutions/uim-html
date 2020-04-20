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
			parameters["title"] =  this.lang;
			if (page) parameters["title"] = page.lang; 
		}

		if ("lang" !in parameters) {
			parameters["lang"] =  this.lang;
			if (page) parameters["lang"] = page.lang; 
		}

		if ("metas" !in parameters) parameters["metas"] = "";
		parameters["metas"] = this.metas.join() ~ (page ? page.metas.join():"") ~ parameters["metas"];

		if ("styles" !in parameters) parameters["styles"] = "";
		parameters["styles"] = this.styles.join() ~ (page ? page.styles.join():"") ~ parameters["styles"];

		if ("css" !in parameters) parameters["css"] = "";
		parameters["css"] = this.css ~ (page ? page.css:"") ~ parameters["css"];

		if ("libraries" !in parameters) parameters["libraries"] = "";
		parameters["libraries"] = this.libraries.join() ~ (page ? page.libraries.join():"") ~ parameters["libraries"];

		if ("script" !in parameters) parameters["script"] = "";
		parameters["script"] = this.script ~ (page ? page.script:"") ~ parameters["script"];

		return toString(page.content, parameters);
	}

	string toString(string content, string[string] parameters = null) {
		auto finalTitle = parameters.get("title", this.title);
		auto finalLang = parameters.get("lang", this.lang);

		auto finalMetas = (this.metas ? this.metas.join():"");
		finalMetas ~= parameters.get("metas", "");

		auto finalLibraries = (this.libraries ? this.libraries.join():"");
		finalLibraries ~= parameters.get("libraries", "");

		auto finalScript = this.script;
		finalScript ~= parameters.get("script", "");

		auto finalStyles = (this.styles ? this.styles.join():"");
		finalStyles ~= parameters.get("styles", "");

		auto finalCss = this.css;
		finalCss ~= parameters.get("css", "");

		// debug // writeln("Create HTML");
		auto result = H5Html
		.attributes("lang", finalLang).attributes("dir", ("dir" in parameters ? parameters["dir"] : "ltr"))
		.head(_headClasses)
		.head(_headAttributes)
		.head(finalMetas)
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(finalStyles)
		.head(finalCss.length > 0 ? "<style>"~finalCss~"</style>":"")
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, this.parameters) : content)
		.body_(finalLibraries)
		.body_(finalScript.length > 0 ? "<script>"~finalScript~"</script>":"");

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
