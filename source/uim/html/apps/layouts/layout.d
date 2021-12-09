module uim.html.apps.layouts.layout;

@safe:
import uim.html;

/// Page layout
class DH5AppLayout {
	this() { _lang = "en"; }

	string[] _headClasses;
	STRINGAA _headAttributes;
	string[] _bodyClasses;
	STRINGAA _bodyAttributes;

	mixin(XStringAA!"parameters");
	
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
		version(uim_html) {
			/// TODO
	}}

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
		version(uim_html) {
			/// TODO
	}}

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
		version(uim_html) {
			/// TODO
	}}

  mixin(XString!("headPart"));
	mixin(XString!("bodyPart"));

	// Cascading layouts
	mixin(OProperty!("DH5AppLayout", "layout"));

	// #region render

	void beforeRender(STRINGAA options = null) {
		debugMethodCall(moduleName!DH5AppLayout~":DH5AppLayout::beforeRender");
	}

	string render(DH5AppController controller, DH5AppView view, STRINGAA options = null) { 
		auto renderedView = view.render(options);
		debug writeln("renderedView ("~view.name~") = '", renderedView, "'");

		return render(controller, renderedView, options);
	}

	string render(DH5AppController controller, string renderedView, STRINGAA options = null) { 
		debugMethodCall(moduleName!DH5AppLayout~":DH5AppLayout::render");
		beforeRender(options);

		// 1. page parameters to options
		if (controller) foreach(k,v; controller.parameters) options[k] = v; 
		// 2. layout parameters to options
		foreach(k,v; parameters) if (k !in options) options[k] = v;
		// 3. app parameters to options
		DH5App app;
		if (controller) app = controller.app; 
		if (app) {
			options["rootPath"] = app.rootPath;      
			foreach(k,v; app.parameters) if (k !in options) options[k] = v; }

		DH5Meta[] 	actualMetas;
		DH5Link[] 	actualLinks;
		DH5Style[] 	actualStyles;
		DH5Script[] actualScripts;
		if (auto page = cast(DH5AppPage)controller) {
			actualMetas = (app ? app.metas : null)  ~ this.metas ~ (page ? page.metas : null);
			actualLinks = /* (app ? app.links : null) ~  */this.links ~ (page ? page.links : null);
			actualStyles = (app ? app.styles : null) ~ this.styles ~ (page ? page.styles : null);
			actualScripts = (app ? app.scripts : null) ~ this.scripts ~ (page ? page.scripts : null);
		}

		// creating HTML page
		_html = H5Html
		.attributes("lang", options.get("lang", "en")).attributes("dir", options.get("dir", "ltr"))
		// Head part of HTML
		.head(_headClasses)
		.head(_headAttributes)
		.head(options.get("title", null) ? "<title>" ~ options.get("title", null) ~ "</title>":"")
		.head(actualMetas.asString~options.get("metas", ""))
		.head(actualLinks.asString~options.get("links", ""))
		.head("link" in options ? options["link"] : "")
		.head(actualStyles.asString~options.get("styles", ""))
		.head("style" in options ? H5Style(options["style"]).toString : "")
		// Body part of HTML
		.body_(_bodyClasses)
		.body_(_bodyAttributes)
		.body_(this.layout ?  this.layout.render(controller, renderedView, options) : renderedView)
		.body_(actualScripts.map!(a => a.toString).array.join(""))
		.body_("script" in options ? H5Script(options["script"]).toString : "");

		return _html.toString;
	}
	unittest {
		// writeln(H5AppLayout);
		// assert(H5AppLayout.render == `<!doctype html><html dir="ltr" lang="en"><head></head><body></body></html>`);
		//assert(H5AppLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"><head></head><body>xxx</body></html>`);
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {
	version(uim_html) {
		/// TODO
}}
