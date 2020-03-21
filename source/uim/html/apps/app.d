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
	O index(this O)(DH5AppPage newPage) { _index = newPage; page("index", newPage); return cast(O)this; }
	unittest {		
		/// TODO
	}

	mixin(XStringAA!"use");
	unittest {
		/// TODO 
	}	

	/// Manage objs of an app
	DH5AppObj[string] _objs;
	auto objs() { return _objs; }
	O objs(this O)(DH5AppObj[string] addObjs) { foreach(name, addObj; addObjs) this.obj(addObj); return cast(O)this; }
	O objs(this O)(DH5AppObj[] addObjs...) { foreach(addObj; addObjs) this.obj(addObj); return cast(O)this; }

	O obj(this O)(DH5AppObj addObj) { this.obj(addObj.name, addObj); return cast(O)this; }
	O obj(this O)(string name, DH5AppObj addObj) { addObj.app(this); _objs[name] = addObj; return cast(O)this; }
	
	DH5AppObj opIndex(string name) { if (name in _objs) return _objs[name]; return null; }

	O remove(this O)(string[] names...) { foreach(name; names) _objs.remove(name); return cast(O)this; }
	O clear(this O)(string name) { _objs = null; return cast(O)this; }
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
		assert(H5App.style("test", "testContent").isStyle("test"));
		assert(!H5App.page("test", "testContent").isStyle("test"));
	}

	O styles(this O)(DH5AppStyle[] addStyles) { foreach(addStyle; addStyles) this.style(name, addStyle); return cast(O)this; }
	O styles(this O)(DH5AppStyle[] addStyles...) { foreach(addStyle; addStyles) this.style(name, addStyle); return cast(O)this; }
	O styles(this O)(DH5AppStyle[string] addStyles) { foreach(name, addStyle; addStyles) this.style(name, addStyle); return cast(O)this; }
	O styles(this O)(string[string] addStyles) { foreach(name, addStyle; addStyles) this.style(name, addStyle); return cast(O)this; }

	O style(this O)(string name, string addStyle) { this.style(name, H5AppStyle(this, name).content(addStyle)); return cast(O)this; }
	O style(this O)(DH5AppStyle addStyle) { this.style(addStyle.name, addStyle); return cast(O)this; }
	O style(this O)(string name, DH5AppStyle addStyle) { this.obj(name, addStyle); return cast(O)this; }

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
		assert("test" in H5App.image("test", "testContent").imagesByName());
		assert("xyz" !in H5App.image("test", "testContent").imagesByName());
	}
	bool isImage(string name) { 
		if (name in _objs) 
			if (cast(DH5AppImage)_objs[name]) return true; 
		return false; }
	unittest {
		assert(H5App.image("test", "testContent").isImage("test"));
		assert(!H5App.page("test", "testContent").isImage("test"));
	}

	O images(this O)(string[] addImages) { foreach(addImage; addImages) this.image(addImage); return cast(O)this; }
	O images(this O)(string[] addImages...) { foreach(addImage; addImages) this.image(addImage); return cast(O)this; }
	O images(this O)(DH5AppImage[string] addImages) { foreach(name, addImage; addImages) this.image(name, addImage); return cast(O)this; }
	O images(this O)(string[string] addImages) { foreach(name, addImage; addImages) this.image(name, addImage); return cast(O)this; }

	O image(this O)(string name, string addImage) { this.image(name, H5AppImage(this, name).content(addImage)); return cast(O)this; }
	O image(this O)(DH5AppImage addImage) { this.image(addImage.name, addImage); return cast(O)this; }
	O image(this O)(string name, DH5AppImage addImage) { this.obj(name, addImage); return cast(O)this; }

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
		assert(H5App.script("test", "testContent").isScript("test"));
		assert(!H5App.page("test", "testContent").isScript("test"));
	}

	O scripts(this O)(DH5AppScript[] addScripts) { foreach(addScript; addScripts) this.script(addScript); return cast(O)this; }
	O scripts(this O)(DH5AppScript[] addScripts...) { foreach(addScript; addScripts) this.script(addScript); return cast(O)this; }
	O scripts(this O)(DH5AppScript[string] addScripts) { foreach(name, addScript; addScripts) this.script(name,addScript); return cast(O)this; }
	O scripts(this O)(string[string] addScripts) { foreach(name; addScripts) this.script(name, addScript); return cast(O)this; }

	O script(this O)(string name, string addScript) { this.script(name, H5AppScript(this, name).content(addScript)); return cast(O)this; }
	O script(this O)(DH5AppScript addScript) { this.script(addScript.name, addScript); return cast(O)this; }
	O script(this O)(string name, DH5AppScript addScript) { this.obj(name, addScript); return cast(O)this; }

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
		assert(H5App.page("test", "testContent").isPage("test"));
		assert(!H5App.script("test", "testContent").isPage("test"));
	}

	O pages(this O)(DH5AppPage[] newPages) { foreach(page; newPages) this.page(page); return cast(O)this; }
	O pages(this O)(DH5AppPage[] newPages...) { foreach(page; newPages) this.page(page); return cast(O)this; }
	O pages(this O)(DH5AppPage[string] newPages) { foreach(name, page; newPages) this.page(name, page); return cast(O)this; }
	O pages(this O)(string[string] newPages) { foreach(name, page; newPages) this.page(name, page); return cast(O)this; }

	O page(this O)(string name, string newPage, string[string] pageParameters = null) { this.page(name, H5AppPage(this, name).content(newPage).parameters(pageParameters)); return cast(O)this; }
	O page(this O)(DH5AppPage newPage, string[string] pageParameters = null) { this.page(newPage.name, newPage.app(this).parameters(pageParameters)); return cast(O)this; }	
	O page(this O)(string name, DH5AppPage newPage, string[string] pageParameters = null) { this.obj(name, newPage.app(this).parameters(pageParameters)); return cast(O)this; }

	O removePages(this O)(string[] names...) { this.remove(names); return cast(O)this; }
	O clearPages(this O)() { foreach(name, item; _objs) if (auto obj = cast(DH5AppPage)item) this.remove(name); return cast(O)this; }
	unittest {	
			writeln(H5App.page("test", "testcontent").pages.length);	
			writeln(H5App.page("test", "testcontent").pages);	
			assert(H5App.page("test", "testcontent").pages.length == 1);	
			assert(H5App.page("test", "testcontent").removePages("test").pages.length == 0);	
	}

	/// Central request handler
	O registerApp(this O)(URLRouter router) {
		debug writeln("Register app -", this.rootPath);
		router.get(this.rootPath ~ "*", &this.request);
		router.post(this.rootPath ~ "*", &this.request);	

		return cast(O)this;
	}
	unittest {	
			/// TODO	
	}

	/// Central request handler
	void request(HTTPServerRequest req, HTTPServerResponse res) {
		writeln("HTMLApp");
		/// Extract appPath from URL path
		debug writeln("req.path - ", req.path);
		debug writeln("rootPath - ", rootPath);
	  auto appPath = req.path.replace(rootPath, "");
		debug writeln("appPath  - ", appPath);

		if (req.path == rootPath) {
			if ("index" in _objs) _objs["index"].request(req, res);
		}

		auto pathItems = appPath.split("/");

		if (appPath in _objs) {
			debug writeln("Found - ", appPath);
			debug writeln("Found - ", _objs[appPath].name);
			_objs[appPath].request(req, res);
		}
/*
		/// Short path -> direct pages
		if (pathItems.length == 1) { 
			debug writeln("pathItems.length == 1");
			auto objName = pathItems[0];
			debug writeln("objName = ", objName);
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
			debug writeln("pathItems.length > 1");
			auto folder = pathItems[0];
			auto objName = pathItems[1..$].join("/");
			debug writeln("objName = ", objName);
			switch(folder) {			
				case "css": 
					debug writeln("css");
					if (objName in _styles) _styles[objName].request(req, res);
					break;
				case "img": 
					debug writeln("img");
					if (objName in _images) _images[objName].request(req, res);
					break;
				case "js": 
					debug writeln("js");
					if (objName in _scripts) {
						debug writeln("Looking for a script in exiting: ", _scripts.keys);
						_scripts[objName].request(req, res);
					}
					break;
				case "page": 
					debug writeln("page");
					break;
				case "data": 
					debug writeln("data");
					/// TODO
					break;
				default: 
					break;
			}
		}
		debug writeln("Request not found"); // Error */
	} 
}
auto H5App() { return new DH5App(); }
auto H5App(string aName) { return new DH5App(aName); }
auto H5App(string aName, string aRootPath) { return new DH5App(aName, aRootPath); }

unittest {
		/// TODO
}