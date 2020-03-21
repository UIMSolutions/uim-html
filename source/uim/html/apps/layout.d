module uim.html.apps.layout;

import uim.html;

/// Page layout
 class DH5AppLayout : DH5AppObj {
	this() { super(); }
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

	string[] _libraries;
	string[] libraries() { return _libraries; }
	O libraries(this O)(string link, string[] links...) { this.library(link).libraries(links); return cast(O)this;}
	O libraries(this O)(string[] links) { foreach(l; links) this.library(l); return cast(O)this;}

	O library(this O)(string libName, string libVersion, string libFile) { this.library("/lib/%s/%s/%s".format(libName, libVersion, libFile)); return cast(O)this;}
	O library(this O)(string link) { this.library(H5Script(["src":link])); return cast(O)this; }
	O library(this O)(DH5Script link) { _libraries ~= link.toString; return cast(O)this; }
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

	string opCall() { return toString(null); }
	string opCall(string content, string[string] parameters = null) { return toString(content, parameters); }
	string toString(string content, string[string] parameters = null) {
	/*	auto result = "<!doctype html>";
		result ~= ``;
		result ~= `<html><head>`~preHead;
		result ~= postHead~`</head>`;
		result ~= `<body>`~_preContent~content~_postContent~`</body></html>`;
//		return result;
*/
	auto result = H5Html
	.attributes("lang", ("lang" in parameters ? parameters["lang"] : "en"))
	.attributes("dir", ("dir" in parameters ? parameters["dir"] : "ltr"))
	.head(_headClasses)
	.head(_headAttributes)
	.head(this.metas.join()~("metas" in parameters ? parameters["metas"] : ""))
	.head("title" in parameters ? H5Title(parameters["title"]).toString : H5Title(this.title).toString)
	.head(this.styles.join()~("styles" in parameters ? parameters["styles"] : ""))
	.head("style" in parameters ? H5Style(parameters["style"]).toString : "")
	.body_(_bodyClasses)
	.body_(_bodyAttributes)
	.body_(this.layout ?  this.layout.toString(content, this.parameters) : content)
	.body_(this.libraries.join()~("libraries" in parameters ? parameters["libraries"] : ""))
	.body_("script" in parameters ? H5Script(parameters["script"]).toString : "");

		return result.toString;
	}
	override string toString() {
		return toString(null, null);
	}
	unittest {
		assert(H5AppLayout == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		writeln(H5AppLayout()("xxx"));
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
