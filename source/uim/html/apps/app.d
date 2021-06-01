module uim.html.apps.app;

import uim.html;

@safe class DH5App {
	this() { init; }
	this(string aName) { this().name(aName); }
	this(string aName, string aRootPath) { this().name(aName).rootPath(aRootPath); }

  string[string][string] peers;
  string[string][string] sessions;

	void init() {
		_layout = new DH5AppLayout;
		this.index(new DH5AppPage);
		this.error(new DH5AppPage);
	}

	/// Id of app
  mixin(OProperty!("DOOPRepository", "repository"));

	mixin(OProperty!("string", "id"));
	unittest {	
			assert(H5App.id("aId").id == "aId");	
			assert(H5App.id("aId").id("otherId").id == "otherId");
	}

	/// Name of app
	mixin(OProperty!("string", "name"));
	unittest {	
			assert(H5App.name("aName").name == "aName");	
			assert(H5App.name("aName").name("otherName").name == "otherName");
	}


	/// Language of app
	string _lang = "en";
	/// Get language of app
	string lang() { return _lang; }
	string language() { return _lang; }
	/// Change language of app
	O lang(this O)(string newLang) { _lang = newLang; return cast(O)this; }
	O language(this O)(string newLang) { _lang = newLang; return cast(O)this; }
	unittest {		
			assert(H5App.lang("aLanguage").lang == "aLanguage");	
			assert(H5App.lang("aLanguage").lang("otherLanguage").lang == "otherLanguage");
			assert(H5App.language("aLanguage").language == "aLanguage");	
			assert(H5App.language("aLanguage").language("otherLanguage").language == "otherLanguage");
	}


	/// Page parameters - will be used to communicate between components
	mixin(XStringAA!"parameters");
	unittest {
		assert(H5App.parameters == null);
		assert(H5App.parameters(["x":"y"]).parameters == ["x":"y"]);
		assert(H5App.parameters("x", "y").parameters == ["x":"y"]);
	}
	unittest {
		/// TODO
	}

	/// central layout for page
	DH5AppLayout _layout;
	auto layout() { if (_layout) return _layout; return null; }
	O layout(this O)(DH5AppLayout newlayout) { _layout = newlayout.app(this); return cast(O)this; }
	unittest {
		/// TODO		
	}

	/// Rootpath of app
	string _rootPath = "/";
	auto  rootPath() { return _rootPath; }
	O rootPath(this O)(string newPath) { _rootPath = newPath; if (!uim.core.datatypes.string_.endsWith(_rootPath, "/")) _rootPath ~= "/"; return cast(O)this; }
	unittest {
		assert(H5App.rootPath("/test/path").rootPath == "/test/path/");		
		assert(H5App.rootPath("/test/path/").rootPath == "/test/path/");		
	}
	auto path() { return _rootPath~"index"; }


	/// Index startpage
	DH5AppPage _index;
	auto index() { return _index; }
	O index(this O)(string newContent) { this.index(H5AppPage.content(newContent)); return cast(O)this; }
	O index(this O)(DH5AppPage newPage) { _index = newPage; this.pages("index", newPage); return cast(O)this; }
	unittest {		
		auto page = H5AppPage;
//		assert(H5App.index(page).index == page);
	}

	/// Login startpage
	DH5AppPage _login;
	auto login() { return _login; }
	O login(this O)(string newContent) { this.login(H5AppPage.content(newContent)); return cast(O)this; }
	O login(this O)(DH5AppPage newPage) { _login = newPage; this.pages("login", newPage); return cast(O)this; }
	unittest {		
		auto page = H5AppPage;
//		assert(H5App.login(page).login == page);
	}

	/// Logout startpage
	DH5AppPage _logout;
	auto logout() { return _logout; }
	O logout(this O)(string newContent) { this.logout(H5AppPage.content(newContent)); return cast(O)this; }
	O logout(this O)(DH5AppPage newPage) { _logout = newPage; this.pages("logout", newPage); return cast(O)this; }
	unittest {		
		auto page = H5AppPage;
//		assert(H5App.logout(page).logout == page);
	}

	/// Index startpage
	DH5AppPage _error;
	auto error() { return _error; }
	O error(this O)(string newContent) { this.error(H5AppPage.content(newContent)); return cast(O)this; }
	O error(this O)(DH5AppPage newPage) { _error = newPage; this.pages("error", newPage); return cast(O)this; }
	unittest {		
		auto page = H5AppPage;
		// assert(H5App.error(page).error == page);
	}

	mixin(XStringAA!"use");
	unittest {
		/// TODO 
	}	

	// ----------
	// Manage the objs of an app. Everything is an obj
	DH5AppObj[string] _objs;

	auto objs() { return _objs; }
	O objs(this O)(DH5AppObj[string] newObjects) { foreach(objName, objNew; newObjects) this.obj(objName, objNew); return cast(O)this; }
	O objs(this O)(DH5AppObj[] newObjects...) { foreach(objNew; newObjects) this.obj(objNew); return cast(O)this; }

	O obj(this O)(DH5AppObj newObject) { this.obj(newObject.name, newObject); return cast(O)this; }
	O obj(this O)(string objName, DH5AppObj newObject) { newObject.app(this); _objs[objName] = newObject; return cast(O)this; }
	
	DH5AppObj opIndex(string name) { if (name in _objs) return _objs[name]; return null; }

	O remove(this O)(string[] names...) { foreach(objName; names) _objs.remove(objName); return cast(O)this; }
	O remove(this O)(string[] names) { foreach(objName; names) _objs.remove(objName); return cast(O)this; }
	O clear(this O)() { _objs = null; return cast(O)this; }
	unittest {	
			/// TODO	
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

	DH5Style[] _styles;
	DH5Style[] styles() { return  _styles; }	
	O styles(this O)(string[] addStyles...) { this.styles(addStyles); return cast(O)this; } // <style>...</style>
	O styles(this O)(string[] addStyles) { _styles ~= addStyles.map!(a => H5Style(a)).array; return cast(O)this;}

	O styles(this O)(string[string] addLink, string[string][] addLinks...) { this.links([link]~links); return cast(O)this;}
	O styles(this O)(string[string][] addLinks) { _links ~= addLinks.map!(a => H5Link(a)); return cast(O)this;}

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
	O scripts(this O)(string[] libs) { foreach(lib; libs) _scripts ~= H5Script(lib); return cast(O)this;}

	O scripts(this O)(string[string] lib, string[string][] libs...) { this.scripts([lib]~libs); return cast(O)this;}
	O scripts(this O)(string[string][] libs) { foreach(lib; libs) _scripts ~= H5Script(lib); return cast(O)this;}

	O scripts(this O)(DH5Script[] libs...) { this.scripts(libs); return cast(O)this;}
	O scripts(this O)(DH5Script[] libs) { _scripts ~= libs; return cast(O)this;}

	O clearScripts(this O)() { _scripts = null; return cast(O)this; }
	unittest {
		// assert(H5AppLayout.)
	}

	auto data() {
		DH5AppData[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppData)obj) results[name] = result;
		return results; }

	O data(this O)(DH5AppData[] addData...) { data(addData); return cast(O)this; }
	O data(this O)(DH5AppData[] addData) { foreach(d; addData) this.data(d.name, d); return cast(O)this; }

	O data(this O)(string[string] addData) { foreach(name, d; addData) this.data(name, d); return cast(O)this; }
	O data(this O)(DH5AppData[string] addData) { foreach(name, d; addData) this.data(name, d); return cast(O)this; }

	O data(this O)(string name, string addData) { this.data(name, DH5AppData(this, name).content(addData)); return cast(O)this; }
	O data(this O)(string name, DH5AppData addData) { this.obj(name, addData); return cast(O)this; }

	/// Remove (only) data files from objs
	O removeData(this O)(string[] names...) { foreach(item; items) if (item.name in _objs) if (auto obj = cast(DH5AppData)_objs[item.name]) this.remove(item.name); return cast(O)this; }
	O removeData(this O)(DH5AppData[] items...) { foreach(item; items) if (item.name in _objs) if (auto obj = cast(DH5AppData)_objs[item.name]) this.remove(item.name); return cast(O)this; }

	O clearData(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppData)item) this.remove(name); return cast(O)this; }
	unittest {	
			/// TODO	
	}

	O styles(this O)(DH5AppStyle[] addStyles) { foreach(addStyle; addStyles) this.styles(addStyle.name, addStyle); return cast(O)this; }
	O styles(this O)(DH5AppStyle[] addStyles...) { foreach(addStyle; addStyles) this.styles(addStyle.name, addStyle); return cast(O)this; }

	O styles(this O)(DH5AppStyle[string] addStyles) { foreach(name, addStyle; addStyles) this.styles(name, addStyle); return cast(O)this; }
	O styles(this O)(string[string] addStyles) { foreach(name, addStyle; addStyles) this.styles(name, addStyle); return cast(O)this; }

	O styles(this O)(string name, string addStyle) { this.styles(name, H5AppStyle(this, name).content(addStyle)); return cast(O)this; }
	O styles(this O)(string name, DH5AppStyle addStyle) { this.obj(name, addStyle); return cast(O)this; }

	O removeStyles(this O)(string[] names...) { foreach(name; names) this.remove(name); return cast(O)this; }
	O clearStyles(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppStyle)item) this.remove(name); return cast(O)this; }
	unittest {	
			/// TODO	
	}

	/// Images of an app
	auto images() {
		DH5AppImage[] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppImage)obj) results ~= result;
		return results; }
	auto imagesByName() {
		DH5AppImage[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppImage)obj) results[name] = result;
		return results; }
	unittest {
		assert("test" in H5App.images("test", "testContent").imagesByName());
		assert("xyz" !in H5App.images("test", "testContent").imagesByName());
	}
	bool isImage(string name) { 
		if (name in _objs) 
			if (cast(DH5AppImage)_objs[name]) return true; 
		return false; }
	unittest {
		assert(H5App.images("test", "testContent").isImage("test"));
		assert(!H5App.pages("test", "testContent").isImage("test"));
	}

	O images(this O)(string[] addImages) { foreach(addImage; addImages) this.images(addImage.name, addImages); return cast(O)this; }
	O images(this O)(string[] addImages...) { foreach(addImage; addImages) this.images(addImage.name, addImages); return cast(O)this; }

	O images(this O)(DH5AppImage[string] addImages) { foreach(name, addImage; addImages) this.images(name, addImage); return cast(O)this; }
	O images(this O)(string[string] addImages) { foreach(name, addImage; addImages) this.images(name, addImage); return cast(O)this; }

	O images(this O)(string name, string addImage) { this.images(name, H5AppImage(this, name).content(addImage)); return cast(O)this; }
	O images(this O)(string name, DH5AppImage addImage) { this.obj(name, addImage); return cast(O)this; }

	O removeImages(this O)(string[] names...) { foreach(name; names) this.remove(name); return cast(O)this; }
	O clearImages(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppImage)item) this.remove(name); return cast(O)this; }
	unittest {	
			/// TODO	
	}

	/* /// Managing Scripts 
	auto getScripts() {
		DH5AppScript[] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppScript)obj) results ~= result;
		return results; }
	auto scriptsByName() {
		DH5AppScript[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppScript)obj) results[name] = result;
		return results; }
	bool isScript(string name) { 
		if (name in _objs) 
			if (cast(DH5AppScript)_objs[name]) return true; 
		return false; }
	unittest {
		assert(H5App.scripts("test", "testContent").isScript("test"));
		assert(!H5App.pages("test", "testContent").isScript("test"));
	}

	O scripts(this O)(DH5AppScript[] addScripts) { foreach(addScript; addScripts) this.scripts(addScript.name, addScript); return cast(O)this; }
	O scripts(this O)(DH5AppScript[] addScripts...) { foreach(addScript; addScripts) this.scripts(addScript.name, addScript); return cast(O)this; }
	
	O scripts(this O)(DH5AppScript[string] addScripts) { foreach(name, addScript; addScripts) this.scripts(name, addScript); return cast(O)this; }
	O scripts(this O)(string[string] addScripts) { foreach(name; addScripts) this.scripts(name, addScript); return cast(O)this; }

	O scripts(this O)(string name, string addScript) { this.scripts(name, H5AppScript(this, name).content(addScript)); return cast(O)this; }
	O scripts(this O)(string name, DH5AppScript addScript) { this.obj(name, addScript); return cast(O)this; }

	O removeScripts(this O)(string[] names...) { foreach(name; names) this.remove(name); return cast(O)this; }
	O clearScripts(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppScript)item) this.remove(name); return cast(O)this; }
	unittest {	
			/// TODO	
	} */

	// Page handling
	// Get all pages of an app
	 auto pages() {
		DH5AppPage[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppPage)obj) results[name] = result;
		return results; }
	unittest {
		auto initPages = H5App.pages.length;
		assert(H5App.pages("test", "testcontent").pages.length == 1 + initPages);	
		assert(H5App.pages("test", "testcontent").pages("test", "testcontent").pages.length == 1 + initPages);	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.length == 2 + initPages);	
	}		
	
	// Get pages by names
	DH5AppPage pageByName(string name) {
		if (name in _objs) if (auto obj = cast(DH5AppPage)_objs[name]) return obj;
		return null; }
	unittest {
		assert(H5App.pages("test", "testcontent").pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pageByName("test").name != "xyz");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pageByName("test").name != "xyz");	
	}		

	DH5AppPage[] pagesByName(string[] names...) { return pagesByName(names); }
	DH5AppPage[] pagesByName(string[] names) {
		DH5AppPage[] results;
		foreach(name; names) if (name in _objs) if (auto obj = cast(DH5AppPage)_objs[name]) results ~= obj;
		return results; }
	unittest {
		assert(H5App.pages("test", "testcontent").pagesByName("test")[0].name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pagesByName("test", "test2")[1].name == "test2");	
	}		

	// Is a (DH5)AppPage or inherit
	bool isPage(string name) { 
		if (name in _objs) 
			if (cast(DH5AppPage)_objs[name]) return true; 
		return false; }
	unittest {
		assert(H5App.pages("test", "testContent").isPage("test"));
		assert(!H5App.scripts("test", "testContent").isPage("test"));
	}

	O pages(this O)(DH5AppPage[] newPages) { foreach(page; newPages) this.pages(page); return cast(O)this; }
	O pages(this O)(DH5AppPage[] newPages...) { foreach(page; newPages) this.pages(page); return cast(O)this; }
	
	O pages(this O)(DH5AppPage[string] newPages) { foreach(name, page; newPages) this.pages(name, page); return cast(O)this; }
	O pages(this O)(string[string] newPages) { foreach(name, page; newPages) this.pages(name, page); return cast(O)this; }

	O pages(this O)(string name, string newPage, string[string] pageParameters = null) { this.pages(name, H5AppPage(this, name).content(newPage).parameters(pageParameters)); return cast(O)this; }
	O pages(this O)(DH5AppPage newPage, string[string] pageParameters) { this.pages(newPage.name, newPage.app(this).parameters(pageParameters)); return cast(O)this; }	
	O pages(this O)(string name, DH5AppPage newPage, string[string] pageParameters = null) { 
		if (newPage.name.length == 0) newPage.name = name; 
		this.obj(name, newPage.app(this).parameters(pageParameters)); 
		return cast(O)this; }

	O removePages(this O)(string[] names...) { foreach(name; names) if (name in _objs) if (auto obj = cast(DH5AppPage)_objs[name]) this.remove(name); return cast(O)this; }
	O clearPages(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppPage)item) this.remove(name); return cast(O)this; }
	unittest {	
			// writeln(H5App.page("test", "testcontent").pages.length);	
			auto initPages = H5App.pages.length;	
			assert(H5App.pages("test", "testcontent").pages.length == 1 + initPages);	
			assert(H5App.pages("test", "testcontent").removePages("test").pages.length == initPages);	
	}

  /* STRINGAA[string] loginTokens;
    bool isLogin(string loginToken) {
      // SessionToken exists?
      if (loginToken !in loginTokens) return false;
      
      // Timeout?
      const lastAccess = to!long(loginTokens[loginToken]["lastAccess"]);
      if ((toTimestamp(now()) - lastAccess) > minutes(5).total!"msecs") return false;

      loginTokens[loginToken]["lastAccess"] = to!string(toTimestamp(now()));
      return true;
    }

    STRINGAA[string] sessionTokens;  
    bool isValid(string sessionToken) {
      // SessionToken exists?
      if (sessionToken !in sessionTokens) return false;
      
      // Timeout?
      const lastAccess = to!long(sessionTokens[sessionToken]["lastAccess"]);
      if ((toTimestamp(now()) - lastAccess) > minutes(5).total!"msecs") return false;

      sessionTokens[sessionToken]["lastAccess"] = to!string(toTimestamp(now()));
      return true;
    } */

	/// Central request handler
	O registerApp(this O)(URLRouter router) {
		// debug // writeln("Register app -", this.rootPath);

		router.any(this.rootPath ~ "*", &this.request);
		
		return cast(O)this;
	}
	unittest {	
			/// TODO	
	}

	/// Central request handler
	void request(HTTPServerRequest req, HTTPServerResponse res) {
		STRINGAA reqParameters = readRequestParameters(req, parameters.dup);
  
    if (req.peer !in peers) peers[req.peer] = ["peer": req.peer];
    peers[req.peer]["lastRequestTime"] = to!string(toTimestamp(req.timeCreated));
  
    reqParameters["peer"] = req.peer;
    reqParameters["peer_lastRequestTime"] = peers[req.peer]["lastRequestTime"];

    if (req.session) {
      string sessionId;
      if (req.session.isKeySet("sessionId")) {
        sessionId = req.session.id;
        if (sessionId !in sessions) sessions[sessionId] = ["sessionId": sessionId]; 
        
        sessions[sessionId]["lastRequestTime"] = to!string(toTimestamp(req.timeCreated));
        reqParameters["sessionId"] = sessionId;
        reqParameters["sessionId_lastRequestTime"] = sessions[sessionId]["lastRequestTime"];
      }
    }

		/// Extract appPath from URL path
		string appPath;
		string reqPath = reqParameters.get("path", rootPath);
	  if (indexOf(reqPath, rootPath) == 0) {
			if (reqPath.length > rootPath.length) appPath = reqPath[reqPath.indexOf(rootPath)+rootPath.length..$];
			else appPath = "";

			if ((appPath.length > 1) && (appPath[$-1..$] == "/")) appPath = appPath[0..$-1];
		}
		reqParameters["appPath"] = appPath;
		debug writeln(reqParameters);

		if (reqPath == rootPath) {
			if ("index" in _objs) {
				_index.request(req, res, reqParameters);
				return; }
			if ("error" in _objs) {
				_error.request(req, res, reqParameters);
				return; }
		}
   
		auto pathItems = appPath.split("/");
		writeln("PathItems: ", pathItems);

		if (appPath in _objs) { // static urls
			writeln("Found Obj -> ", appPath);

			_objs[appPath].request(req, res, reqParameters);
			return;
		}

		debug writeln("dynamic urls");
    // Future release will handle "*" and "?"
		foreach (path, obj; _objs) if (path.indexOf(":") > 0) {
			// writeln(path, " vs ", appPath);
			string[] objPathItems = path.split("/");
      debug writeln("objPathItems -> ", objPathItems.length, " ", objPathItems);
			string[] appPathItems = appPath.split("/");
      debug writeln("appPathItems -> ", appPathItems.length, " ", appPathItems);
			// writeln("ObjPathItems: (", objPathItems.length,") ", objPathItems);
			// writeln("AppjPathItems: (", appPathItems.length,") ", appPathItems);
			if (objPathItems.length < appPathItems.length) continue;
			if (objPathItems.length > appPathItems.length) continue;

			// (objPathItems.length == appPathItems.length)
			bool foundPage = true;
			foreach (index, item; objPathItems) {
				if (!foundPage) break;
				if (item.length == 0) { foundPage = false; break; }
				if (item == appPathItems[index]) continue;

        debug writeln("Hmmm, length equal.");
				if (item.length < 2) { foundPage = false; break; }
				if ((item != appPathItems[index]) && (item.indexOf(":") != 0)) { 
          foundPage = false; break; }

        debug writeln("Hmmm, item has ':'");
				// dynamic part
        // Future release will handle "*" and "?"
				if (item.indexOf(":") == 0) {
					if (item.length > 1) { 
						string op = item[0..1];
						switch(op) {
					  		case ":": 
								reqParameters[item[1..$]] = appPathItems[index];
								break;
							case "?":
								reqParameters[item[1..$]] = appPathItems[index];
								break;
							case "*":
								break;
							default:
								break;
						}
					}
				}
			}

			if (foundPage) { // found dynamic link
				obj.request(req, res, reqParameters);
				return;
			}
		}

		_error.request(req, res, reqParameters);
	} 
}
 auto H5App() { return new DH5App(); }
 auto H5App(string aName) { return new DH5App(aName); }
 auto H5App(string aName, string aRootPath) { return new DH5App(aName, aRootPath); }

unittest {
		/// TODO
}

void redirectCheck(string[string] parameters) {
	writeln("Has Redirect? ", parameters.get("redirect", ""));
	if ("redirect" in parameters) redirect(parameters["redirect"]);
}

auto readRequestParameters(HTTPServerRequest req, STRINGAA reqParameters) {
		reqParameters["method"] = to!string(req.method);
		reqParameters["peer"] = req.peer;
		reqParameters["host"] = req.host;
		reqParameters["path"] = req.path;
		reqParameters["rootDir"] = req.rootDir;
		reqParameters["fullURL"] = req.fullURL.toString;
		reqParameters["queryString"] = req.queryString;
		reqParameters["json"] = req.json.toString;
		reqParameters["username"] = req.username;
		reqParameters["password"] = req.password;
		
		foreach(key; req.params.byKey) reqParameters[key] = req.params[key];
		foreach(key; req.headers.byKey) reqParameters[key] = req.headers[key];
		foreach(key; req.query.byKey) reqParameters[key] = req.query[key];
		foreach(key; req.form.byKey) reqParameters[key] = req.form[key];

		return reqParameters;
}