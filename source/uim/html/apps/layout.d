module uim.html.apps.layout;
@safe:
import uim.html;

/// Page layout
  @safe class DH5AppLayout : DH5AppObj {
	this() { super(); 
	_lang = "en"; }
	this(DH5App anApp) { this().app(anApp); }

	string[] _headClasses;
	STRINGAA _headAttributes;
	string[] _bodyClasses;
	STRINGAA _bodyAttributes;

	mixin(XString!("preHead"));
	mixin(XString!("postHead"));
	mixin(XString!("preContent"));
	mixin(XString!("postContent"));
	mixin(XStringArray!("requires"));
	
	mixin(OString!("lang"));
	mixin(OString!("title"));
	
	mixin(OProperty!("DH5Html", "html"));

	mixin(OProperty!("DH5Obj[]", "navSlots"));	

	DH5Obj _navbar;
	O navbar(this O)(H5Obj newNavbar) {
		_navbar = newNavbar;
		return cast(O)this;
	}
	DH5Obj navbar() {
		return _navbar;
	}

	protected DH5Meta[] _metas;
	DH5Meta[] metas() { return _metas; }
	O metas(this O)(STRINGAA value, STRINGAA[] addMetas...) { this.metas([value]~addMetas); return cast(O)this;}
	O metas(this O)(STRINGAA[] addMetas) { foreach(meta; addMetas) this.metas(H5Meta(meta)); return cast(O)this; }

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
	O links(this O)(STRINGAA link, STRINGAA[] links...) { this.links([link]~links); return cast(O)this;}
	O links(this O)(STRINGAA[] links) { _links ~= links.map!(a => H5Link(a)).array; return cast(O)this;}

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

	O styles(this O)(STRINGAA addLink, STRINGAA[] addLinks...) { this.links([addLink]~addLinks); return cast(O)this;}
	O styles(this O)(STRINGAA[] addLinks) { _links ~= addLinks.map!(a => H5Link(a)).array; return cast(O)this;}

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
	O scripts(this O)(string[] addScripts...) { this.scripts(addScripts); return cast(O)this;}
	O scripts(this O)(string[] addScripts) { _scripts ~= addScripts.map!(a => H5Script(a)).array; return cast(O)this;}

	O scripts(this O)(STRINGAA lib, STRINGAA[] libs...) { this.scripts([lib]~libs); return cast(O)this;}
	O scripts(this O)(STRINGAA[] libs) {  _scripts ~= libs.map!(a => H5Script(a)).array; return cast(O)this;}

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
	string opCall(DH5AppPage page, STRINGAA parameters) { return toString(page, parameters); }
	string opCall(string content, STRINGAA parameters) { return toString(content, parameters); }
	
	override string toString() { return toString("", null); }
	string toString(DH5AppPage page, STRINGAA reqParameters) {
		return toString(page, page.content(reqParameters), reqParameters);
	}

	string toString(DH5AppPage page, string content, STRINGAA reqParameters) {
		if (page) foreach(k,v; page.parameters) if (k !in reqParameters) reqParameters[k] = v;
		foreach(k,v; this.parameters) if (k !in reqParameters) reqParameters[k] = v;

		if (page) {
			reqParameters["lang"] = page.lang;
			reqParameters["title"] = page.title;
		}

		DH5Meta[] newMetas;
		if (app) newMetas ~= app.metas;
		newMetas ~= this.metas;
		if (page) newMetas ~= page.metas;

		DH5Link[] newLinks;		
//		if (app) newLinks = app.links;
		newLinks ~= this.links;
		if (page) newLinks ~= page.links;

		DH5Style[] newStyles;
		if (app) newStyles ~= app.styles;
		newStyles ~= this.styles;
		if (page) newStyles ~= page.styles;

		DH5Script[] newScripts;
		if (app) newScripts ~= app.scripts;
		newScripts ~= this.scripts;
		if (page) newScripts ~= page.scripts;

		return htmlDocument(page, content, newMetas, newLinks, newStyles, newScripts, reqParameters);
	}

	string toString(string content, STRINGAA reqParameters) {
		debug writeln(moduleName!DH5AppLayout~":DH5AppLayout::toString");

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

		return htmlDocument(null, content, newMetas, newLinks, newStyles, newScripts, reqParameters);
	}

	auto htmlDocument(DH5AppPage page, string content, DH5Meta[] newMetas, DH5Link[] newLinks, DH5Style[] newStyles, DH5Script[] newScripts, STRINGAA reqParameters) {
		debug writeln(moduleName!DH5AppLayout~":DH5AppLayout::htmlDocument");

		foreach(kv; this.parameters.byKeyValue) if (kv.key !in reqParameters) reqParameters[kv.key] = kv.value;
		auto finalLang = reqParameters.get("lang", this.lang); // if lang !in parameters use this.lang
		auto finalTitle = reqParameters.get("title", this.title);  // if title !in parameters use this.title

		// creating HTML page
		_html = H5Html
		.attributes("lang", finalLang).attributes("dir", reqParameters.get("dir", "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(finalTitle.length > 0 ? "<title>" ~ finalTitle ~ "</title>":"")
		.head(newMetas.asString~reqParameters.get("metas", ""))
		.head(newLinks.asString~reqParameters.get("links", ""))
		.head("link" in reqParameters ? reqParameters["link"] : "")
		.head(newStyles.asString~reqParameters.get("styles", ""))
		.head("style" in reqParameters ? H5Style(reqParameters["style"]).toString : "")
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.toString(content, reqParameters) : content)
		.body_(newScripts.map!(a => a.toString).array.join(""))
		.body_("script" in reqParameters ? H5Script(reqParameters["script"]).toString : "");

		return _html.toString;
	}
	unittest {
		// writeln(H5AppLayout);
		assert(H5AppLayout == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		//assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {

}
