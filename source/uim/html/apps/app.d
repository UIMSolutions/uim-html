module uim.html.apps.app;

import uim.html;

class DH5App {
	this() { // this.index("Hallo World"); 
	}
	this(string aName) { this().name(aName); }
	this(string aName, string aRootPath) { this().name(aName).rootPath(aRootPath); }

	/// Name of app
	string _name;
	/// Get name of app
	string name() { return _name; }
	/// Change name of app
	O name(this O)(string newName) { _name = newName; return cast(O)this; }
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
		assert(H5App.index(page).index == page);
	}

	mixin(XStringAA!"use");
	unittest {
		/// TODO 
	}	

	/// Manage theobjs of an app
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

	/// Styles (CSS) of an app
	auto styles() {
		DH5AppStyle[] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppStyle)obj) results ~= result;
		return results; }
	auto stylesByName() {
		DH5AppStyle[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppStyle)obj) results[name] = result;
		return results; }
	bool isStyle(string name) { 
		if (name in _objs) 
			if (cast(DH5AppStyle)_objs[name]) return true; 
		return false; }
	unittest {
		assert(H5App.styles("test", "testContent").isStyle("test"));
		assert(!H5App.pages("test", "testContent").isStyle("test"));
	}

	O data(this O)(DH5AppData[] addData) { foreach(d; addData) this.data(d.name, d); return cast(O)this; }
	O data(this O)(DH5AppData[] addData...) { foreach(d; addData) this.data(d.name, d); return cast(O)this; }

	O data(this O)(DH5AppData[string] addData) { foreach(name, d; addData) this.data(name, d); return cast(O)this; }
	O data(this O)(string[string] addData) { foreach(name, d; addData) this.data(name, d); return cast(O)this; }

	O data(this O)(string name, string addData) { this.data(name, DH5AppData(this, name).content(addData)); return cast(O)this; }
	O data(this O)(string name, DH5AppData addData) { this.obj(name, addData); return cast(O)this; }

	O removeData(this O)(DH5AppData[] items...) { foreach(item; items) if (item.name in _objs) if (auto obj = cast(DH5AppData)_objs[item.name]) this.remove(item.name); return cast(O)this; }
	O removeData(this O)(string[] names...) { foreach(name; names) this.remove(name); return cast(O)this; }
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

	/// Managing Scripts 
	auto scripts() {
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
	}

	/// Pages of app
	auto pages() {
		DH5AppPage[] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppPage)obj) results ~= result;
		return results; }
	auto pagesByName() {
		DH5AppPage[string] results;
		foreach(name, obj; _objs) if (auto result = cast(DH5AppPage)obj) results[name] = result;
		return results; }
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
	O pages(this O)(string name, DH5AppPage newPage, string[string] pageParameters = null) { this.obj(name, newPage.app(this).parameters(pageParameters)); return cast(O)this; }

	O removePages(this O)(string[] names...) { this.remove(names); return cast(O)this; }
	O clearPages(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppPage)item) this.remove(name); return cast(O)this; }
	unittest {	
			// writeln(H5App.page("test", "testcontent").pages.length);	
			// writeln(H5App.page("test", "testcontent").pages);	
			assert(H5App.pages("test", "testcontent").pages.length == 1);	
			assert(H5App.pages("test", "testcontent").removePages("test").pages.length == 0);	
	}

	/// Central request handler
	O registerApp(this O)(URLRouter router) {
		// debug // writeln("Register app -", this.rootPath);
		router.get(this.rootPath ~ "*", &this.request);
		router.post(this.rootPath ~ "*", &this.request);	

		return cast(O)this;
	}
	unittest {	
			/// TODO	
	}

	/// Central request handler
	void request(HTTPServerRequest req, HTTPServerResponse res) {
		writeln(this.objs);
		/// Extract appPath from URL path
		debug writeln("req.path - ", req.path);
		debug writeln("rootPath - ", rootPath);
		string appPath;
	  if (indexOf(req.path, rootPath) == 0) {
			if (req.path.length > rootPath.length) appPath = req.path[indexOf(req.path, rootPath)+rootPath.length..$];
			else appPath = "";
			writeln("appPath  - ", appPath);
		}
		if (req.path == rootPath) {
			if ("index" in _objs) _objs["index"].request(req, res);
		}

		auto pathItems = appPath.split("/");
		writeln("PathItems: ", pathItems);

		if (appPath in _objs) {
			writeln("Found Obj -> ", appPath);
			_objs[appPath].request(req, res);
		}
/*
		/// Short path -> direct pages
		if (pathItems.length == 1) { 
			// debug // writeln("pathItems.length == 1");
			auto objName = pathItems[0];
			// debug // writeln("objName = ", objName);
			switch(objName) {				
				case "index":
				case "start": this.index.request(req, res); break;
				case "manifest":
				case "manifest.json": break; /// TODO
				default: 
					if (objName in _styles) _styles[objName].request(req, res);
					if (objName in _images) _images[objName].request(req, res);
					if (objName in _scripts) _scripts[objName].request(req, res);
					// Call Error handler
					/// TODO
					break; //error
			}
		}
		if (pathItems.length > 1) { 
			// debug // writeln("pathItems.length > 1");
			auto folder = pathItems[0];
			auto objName = pathItems[1..$].join("/");
			// debug // writeln("objName = ", objName);
			switch(folder) {			
				case "css": 
					// debug // writeln("css");
					if (objName in _styles) _styles[objName].request(req, res);
					break;
				case "img": 
					// debug // writeln("img");
					if (objName in _images) _images[objName].request(req, res);
					break;
				case "js": 
					// debug // writeln("js");
					if (objName in _scripts) {
						// debug // writeln("Looking for a script in exiting: ", _scripts.keys);
						_scripts[objName].request(req, res);
					}
					break;
				case "page": 
					// debug // writeln("page");
					break;
				case "data": 
					// debug // writeln("data");
					/// TODO
					break;
				default: 
					break;
			}
		}
		// debug // writeln("Request not found"); // Error */
	} 
}
auto H5App() { return new DH5App(); }
auto H5App(string aName) { return new DH5App(aName); }
auto H5App(string aName, string aRootPath) { return new DH5App(aName, aRootPath); }

unittest {
		/// TODO
}