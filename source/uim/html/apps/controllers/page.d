module uim.html.apps.controllers.page;

@safe:
import uim.html;

class DH5AppPage : DH5AppController {
	this() { super(); 
	clearMetas;
	clearLinks;
	clearStyles;
	clearScripts;
	
	this.mimetype("text/html"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

	mixin(OProperty!("string", "title"));
	unittest {
		assert(H5AppPage.title("aTitle").title == "aTitle");	
		assert(H5AppPage.title("aTitle").title("otherTitle").title == "otherTitle");
	}

	// window events

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

	STRINGAA keywords;
	
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
	O links(this O)(STRINGAA addLink, STRINGAA[] addLinks...) { this.links([addLink]~addLinks); return cast(O)this;}
	O links(this O)(STRINGAA[] addLinks) { 
		foreach(link; addLinks) _links ~= H5Link(link); 
		return cast(O)this;}

	O links(this O)(DH5Link[] links...) { this.links(links); return cast(O)this;}
	O links(this O)(DH5Link[] links) { _links ~= links; return cast(O)this;}

	O clearLinks(this O)() { _links = null; return cast(O)this; }
	unittest {
		/// TODO
	}

  O addLink(this O)(STRINGAA reqParameters, string text) { reqParameters["link"] = reqParameters.get("link", "")~text; return cast(O)this;}


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

  O addStyle(this O)(STRINGAA reqParameters, string text) { reqParameters["style"] = reqParameters.get("style", "")~text; return cast(O)this;}


	DH5Script[] _scripts;
	DH5Script[] scripts() { return _scripts; }

	O scripts(this O)(string[] addScripts...) { this.scripts(addScripts); return cast(O)this;}
	O scripts(this O)(string[] addScripts) { this.scripts(addScripts.map!(a => H5Script(a)).array); return cast(O)this;}

	O scripts(this O)(STRINGAA[] addScripts...) { this.scripts(addScripts); return cast(O)this;}
	O scripts(this O)(STRINGAA[] addScripts) { this.scripts(addScripts.map!(a => H5Script(a)).array); return cast(O)this;}

	O scripts(this O)(DH5Script[] addScripts...) { this.scripts(addScripts); return cast(O)this;}
	O scripts(this O)(DH5Script[] addScripts) { _scripts ~= addScripts; return cast(O)this;}

	O clearScripts(this O)() { _scripts = null; return cast(O)this; }
  unittest {
		// assert(H5AppLayout.)
	}

	O addScript(this O)(STRINGAA reqParameters, string text) { reqParameters["script"] = reqParameters.get("script", "")~text; return cast(O)this;}

  string opIndex(string key) {
    switch(key) {
      case "title": return title;
      default: return "";
    }
  }

  DH5Obj[] toH5(STRINGAA reqParameters) {
    return null;
  }
	
	/// Export to string
	override string toString(STRINGAA reqParameters) {
		debug writeln(moduleName!DH5AppPage~":DH5AppPage::toString");

		debug writeln("Check layout");
		DH5AppLayout lt;
		if (app) lt = app.layout;
		if (this.layout) lt = this.layout;

		// if layout, use layout
		if (lt) return this.layout.toString(this, reqParameters);

		debug writeln("Has no layout");
    if (auto h5 = toH5(reqParameters)) return h5.map!(a => a.toString).join;
		return this.content(reqParameters); // No layout, only content
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
	  // TOODO add @safe assert(H5AppPage(app).app == app);
    assert(H5AppPage(app, "name").name == "name");
    // TOD add @safe assert(H5AppPage(app, "name").app == app);
    assert(H5AppPage(app, "name").name("newname").name() == "newname");
}

	// Get page by names
	 DH5AppPage pageByName(DH5AppPage[] pages, string name) {
		foreach(page; pages) if (page.name == name) return page;
		return null; }
	unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
 */	}		
