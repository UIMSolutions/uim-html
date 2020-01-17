module uim.html.apps.app;

import uim.html;

class DH5App {
	this() { this.index("Hallo World"); }
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
	O rootPath(this O)(string newPath) { _rootPath = newPath; if (uim.core.datatypes.string_.endsWith(_rootPath, "/")) _rootPath = _rootPath[0..$-1]; return cast(O)this; }
	unittest {
		assert(H5App.rootPath("/test/path").rootPath == "/test/path");		
		assert(H5App.rootPath("/test/path/").rootPath == "/test/path");		
	}
	auto path() { return _rootPath~"/index"; }


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

	/// Styles (CSS) of an app
	DH5AppStyle[string] _styles;
	auto styles() { return _styles; }
	O styles(this O)(DH5AppStyle[string] addStyle) { foreach(name, style; addStyle) this.css(name, style); return cast(O)this; }
	O styles(this O)(string[string] addStyle) { foreach(name, style; addStyle) this.style(name, style); return cast(O)this; }
	O styles(this O)(string name, DH5AppStyle addStyle) { addStyle.app(this); _styles[name] = addStyle; return cast(O)this; }
	O styles(this O)(string name, string addStyle) { _styles[name] = H5AppStyle(this).content(addStyle); return cast(O)this; }
	O styles(this O)(DH5AppStyle addStyle) { addStyle.app(this); _styles[addStyle.name] = addStyle; return cast(O)this; }
	O removeStyle(this O)(string name) { _styles.remove(name); return cast(O)this; }
	O clearStyles(this O)(string name) { _styles = null; return cast(O)this; }
	unittest {	
			/// TODO	
	}

	/// Images of an app
	DH5AppImage[string] _images;
	auto images() { return _images; }
	O image(this O)(DH5AppImage[string] addImage) { foreach(name, image; addImage) this.image(name,image); return cast(O)this; }
	O image(this O)(string[string] addImage) { foreach(name, image; addImage) this.image(name,image); return cast(O)this; }
	O image(this O)(string name, DH5AppImage addImage) { addImage.app(this); _image[name] = addImage; return cast(O)this; }
	O image(this O)(string name, string addImage) { _image[name] = H5AppImage(this).content(addImage); return cast(O)this; }
	O image(this O)(DH5AppImage addImage) { addImage.app(this); _image[addImage.name] = addImage; return cast(O)this; }
	O removeImage(this O)(string[] names...) { foreach(name; names) _images.remove(name); return cast(O)this; }
	O clearImages(this O)() { _images = null; return cast(O)this; }
	unittest {	
			/// TODO	
	}

/// Images of an app
	DH5AppScript[string] _scripts;
	auto scripts() { return  _scripts; }
	O scripts(this O)(DH5AppScript[string] addScript) { foreach(kv; addScript.byKeyValue) this.script(kv.key,kv.value); return cast(O)this; }
	O scripts(this O)(string[string] addScript) { foreach(kv; addScript.byKeyValue) this.script(kv.key,kv.value); return cast(O)this; }
	O scripts(this O)(string name, DH5AppScript addScript) { _scripts[name] = addScript.app(this); return cast(O)this; }
	O scripts(this O)(string name, string addScript) { _scripts[name] = H5AppScript(this).content(addScript); return cast(O)this; }
	O scripts(this O)(DH5AppScript addScript) { addScript.app(this); _scripts[addScript.name] = addScript.app(this); return cast(O)this; }

	O script(this O)(DH5AppScript addScript) { this.script(addScript.name, addScript); return cast(O)this; }
	O script(this O)(string name, DH5AppScript addScript) { _scripts[name] = addScript.app(this); return cast(O)this; }

	O removeScripts(this O)(string[] names...) { foreach(name; names) _scripts.remove(name); return cast(O)this; }
	O clearScripts(this O)() { _scripts = null; return cast(O)this; }
	unittest {	
			/// TODO	
	}

	/// Pages of app
	protected DH5AppPage[string] _pages;
	@property DH5AppPage[string] pages() { return _pages; }
	O pages(this O)(DH5AppPage[] newPages) { foreach(page; newPages) this.page(page); return cast(O)this; }
	O pages(this O)(DH5AppPage[string] newPages) { foreach(name, page; newPages) this.pages(name,page); return cast(O)this; }
	O pages(this O)(string[string] newPages) { foreach(name, page; newPages) this.pages(name, page); return cast(O)this; }
	O pages(this O)(string name, DH5AppPage newPage) { newPage.app(this); _pages[name] = newPage; return cast(O)this; }
	O pages(this O)(string name, string newPage, string[string] pageParameters = null) { _pages[name] = H5AppPage(this).content(newPage).parameters(pageParameters); return cast(O)this; }

	O page(this O)(string name, string newPage, string[string] pageParameters = null) { _pages[name] = H5AppPage(this, name).content(newPage).parameters(pageParameters); return cast(O)this; }
	O page(this O)(DH5AppPage newPage) { newPage.app(this); _pages[newPage.name] = newPage; return cast(O)this; }	
	O page(this O)(string name, DH5AppPage newPage) { newPage.app(this); _pages[newPage.name] = newPage; return cast(O)this; }

	O removePages(this O)(string[] names...) { foreach(name; names) _pages.remove(name); return cast(O)this; }
	O clearPages(this O)() { _pages = null; return cast(O)this; }
	unittest {	
			/// TODO	
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
		debug writeln("req.path -", req.path);
		debug writeln("rootPath -", rootPath);
	  auto appPath = req.path.replace(rootPath, "");
		debug writeln("appPath  -", appPath);
		auto pathItems = appPath.split("/");
		while ((pathItems.length > 0) && (pathItems[0].length == 0)) pathItems = pathItems[1..$];
		debug writeln("pathItems-", pathItems);

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
					if (objName in _pages) _pages[objName].request(req, res);
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
					if (objName in _pages) _pages[objName].request(req, res);
					break;
				case "data": 
					debug writeln("data");
					/// TODO
					break;
				default: 
					break;
			}
		}
		if (appPath in _pages) _pages[appPath].request(req, res);
		debug writeln("Request not found"); // Error
	}
}
auto H5App() { return new DH5App(); }
auto H5App(string aName) { return new DH5App(aName); }
auto H5App(string aName, string aRootPath) { return new DH5App(aName, aRootPath); }

unittest {
		/// TODO
}