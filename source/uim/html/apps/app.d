module uim.html.apps.app;

import uim.html;

class DH5App {
	this() { }
	this(string aName) { this(); _name = aName; }
	this(string aName, string someContent) { this(aName); _content = someContent; }

	mixin(TProperty!("string", "rootPath"));
	mixin(TProperty!("string", "content"));
	mixin(TProperty!("string", "name"));

	mixin(TProperty!("DH5Page", "index"));
	O index(this O)(string newContent) { _index = VUEIndex.content(newContent); return cast(O)this; }
	O index(this O)(string newContent, string function(string, string[string]) func, string[string] someParameters = null) { _index = H5Page.content(newContent).layout(func).parameters(someParameters); return cast(O)this; }

	mixin(TProperty!("DH5Page[string]", "pages"));
	O pages(this O)(string name, DH5Page newPage) { newPage.app(this); _pages[name] = newPage; return cast(O)this; }
	O pages(this O)(string name, string newPage) { _pages[name] = H5Page(this).content(newPage); return cast(O)this; }
	O page(this O)(DH5Page newPage) { newPage.app(this); _pages[newPage.name] = newPage; return cast(O)this; }

	void request(HTTPServerRequest req, HTTPServerResponse res) {
		auto path = req.path.replace(_rootPath, "");
		auto pathItems = path.split("/");

		if (pathItems.length > 0) {
			switch(pathItems[0]) {				
				case "index":
				case "start": _index.request(req, res); break;
				default: 
					string name;
					if (pathItems.length > 1) {
						auto type = pathItems[0];
						name = pathItems[1..$].join("/").replace(".js", "");
						switch(type) {
							case "css": break;
							case "img": break;
							case "js": break;
							case "page": if (name in _pages) _pages[name].request(req, res); break;
							default: break;
						}
					}
					else {
						if (name in _pages) _pages[name].request(req, res);
					}
				break;
			}
		}
	}
	override string toString() {
		return (_content) ? _content : "";
	}
}
auto H5App() { return new DH5App(); }

unittest {
}