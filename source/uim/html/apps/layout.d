module uim.html.apps.layout;

import uim.html;

/// Page layout
  @safe class DH5AppLayout : DH5AppObj {
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
	
	mixin(OProperty!("DH5Html", "html"));

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

	DH5Link[] _links;
	DH5Link[] links() { return  _links; }	
	O links(this O)(string[string] link, string[string][] links...) { this.links([link]~links); return cast(O)this;}
	O links(this O)(string[string][] links) { foreach(link; links) _links ~= H5Link(link); return cast(O)this;}

	O links(this O)(DH5Link[] links...) { this.links(links); return cast(O)this;}
	O links(this O)(DH5Link[] links) { _links ~= links; return cast(O)this;}

	O clearLinks(this O)() { _links = null; return cast(O)this; }
	unittest {
		/// TODO
	}

	DH5Style[] _styles;
	DH5Style[] styles() { return  _styles; }	
	O styles(this O)(string addStyle, string[] addStyles...) { this.styles([addStyle]~addStyles); return cast(O)this; } // <style>...</style>
	O styles(this O)(string[] addStyles) { _styles ~= addStyles.map!(a => H5Style(a)).array; return cast(O)this;}

	O styles(this O)(string[string] addLink, string[string][] addLinks...) { this.links([addLink]~addLinks); return cast(O)this;}
	O styles(this O)(string[string][] addLinks) { _links ~= addLinks.map!(a => H5Link(a)).array; return cast(O)this;}

	O styles(this O)(DH5Style[] addStyles...) { this.styles(addStyles); return cast(O)this; }
	O styles(this O)(DH5Style[] addStyles) { _styles ~= addStyles; return cast(O)this; }
	O styles(this O)(DH5Link[] addLinks...) { this.styles(addLinks); return cast(O)this; }
	O styles(this O)(DH5Link[] addLinks) { _links ~= addLinks; return cast(O)this; }

	O clearStyles(this O)() { _styles = null; return cast(O)this; }
	unittest {
		/// TODO
	}

	DH5Script[] _scripts;
	DH5Script[] scripts() { return _scripts; }
	O scripts(this O)(string lib, string[] libs...) { this.scripts([lib]~libs); return cast(O)this;}
	O scripts(this O)(string[] libs) { foreach(lib; libs) _scripts ~= H5Script(["src":lib]); return cast(O)this;}

	O scripts(this O)(string[string] lib, string[string][] libs...) { this.scripts([lib]~libs); return cast(O)this;}
	O scripts(this O)(string[string][] libs) { foreach(lib; libs) _scripts ~= H5Script(lib); return cast(O)this;}

	O scripts(this O)(DH5Script[] libs...) { this.scripts(libs); return cast(O)this;}
	O scripts(this O)(DH5Script[] libs) { _scripts ~= libs; return cast(O)this;}

	O clearScripts(this O)() { _scripts = null; return cast(O)this; }
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
	string toString(DH5AppPage page, string[string] someParameters = null) {
		return toString(page, page.content, someParameters);
	}

	string toString(DH5AppPage page, string content, string[string] reqParameters = null) {
		// layout override app, page override layout, parameters override page
		// Layout overrides app
		foreach(k,v; this.parameters) reqParameters[k] = v;
		// page overrides layout & app
		if (page) foreach(k,v; page.parameters) reqParameters[k] = v;

		reqParameters["lang"] = page.lang;
		reqParameters["title"] = page.title;

		DH5Meta[] newMetas;
		if (app) newMetas ~= app.metas;
		newMetas ~= this.metas;
		newMetas ~= page.metas;

		DH5Link[] newLinks;		
//		if (app) newLinks = app.links;
		newLinks ~= this.links;
		newLinks ~= page.links;

		DH5Style[] newStyles;
		if (app) newStyles ~= app.styles;
		newStyles ~= this.styles;
		newStyles ~= page.styles;

		DH5Script[] newScripts;
		if (app) newScripts ~= app.scripts;
		newScripts ~= this.scripts;
		newScripts ~= page.scripts;

		return htmlDocument(content, newMetas, newLinks, newStyles, newScripts, reqParameters);
	}

	string toString(string content, string[string] reqParameters = null) {
		// layout override app, parameters override layout
		// Layout overrides app
		foreach(k,v; this.parameters) reqParameters[k] = v;

		DH5Meta[] newMetas;
		if (app) newMetas = app.metas;
		newMetas ~= this.metas;

		DH5Link[] newLinks;		
//		if (app) newLinks = app.links;
		newLinks ~= this.links;

		DH5Style[] newStyles;
		if (app) newStyles = app.styles;
		newStyles ~= this.styles;

		DH5Script[] newScripts;
		if (app) newScripts ~= app.scripts;
		newScripts ~= this.scripts;

		return htmlDocument(content, newMetas, newLinks, newStyles, newScripts, reqParameters);
	}

	auto htmlDocument(string content, DH5Meta[] newMetas, DH5Link[] newLinks, DH5Style[] newStyles, DH5Script[] newScripts, string[string] parameters = null) {
		auto finalLang = parameters.get("lang", this.lang); // if lang !in parameters use this.lang
		auto finalTitle = parameters.get("title", this.title);  // if title !in parameters use this.title

		// creating HTML page
		_html = H5Html
		.attributes("lang", finalLang).attributes("dir", parameters.get("dir", "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(newMetas.asString~parameters.get("metas", ""))
		.head(newLinks.asString~parameters.get("links", ""))
		.head(newStyles.asString~parameters.get("styles", ""))
		.head("style" in parameters ? H5Style(parameters["style"]).toString : "")
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, parameters) : content)
		.body_(newScripts.asString~parameters.get("scripts", ""))
		.body_("script" in parameters ? H5Script(parameters["script"]).toString : "");

		return _html.toString;
	}
	unittest {
		// writeln(H5AppLayout);
		assert(H5AppLayout == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {

}
