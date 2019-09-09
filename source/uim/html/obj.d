module uim.html.obj;

import uim.html;

class DH5Obj {
	 this() { _init; }
	 this(string content) { this(); this.content(content); }
	 this(DH5Obj[] content...) { this(); this.content(content); }
	 this(DH5 content) { this(); this.content(content); }
	
	 this(string id, string content) { this(); this.id(id).content(content); }
	 this(string id, DH5Obj[] content...) { this(); this.id(id).content(content); }
	 this(string id, DH5 content) { this(); this.id(id).content(content); }

	 this(string id, string[] classes) { this(); this.id(id).classes(classes); }
	 this(string id, string[] classes, string content) { this(id, classes); this.content(content); }
	 this(string id, string[] classes, DH5Obj[] content...) { this(id, classes); this.content(content); }
	 this(string id, string[] classes, DH5 content) { this(id, classes); this.content(content); }
	
	 this(string id, string[string] attributes) { this(); this.id(id); _attributes(attributes); }
	 this(string id, string[string] attributes, string content) { this(id, attributes); this.content(content); }
	 this(string id, string[string] attributes, DH5Obj[] content...) { this(id, attributes); this.content(content); }
	 this(string id, string[string] attributes, DH5 content) { this(id, attributes); this.content(content); }
	
	 this(string id, string[] classes, string[string] attributes) { this(id, classes); _attributes(attributes); }
	 this(string id, string[] classes, string[string] attributes, string content) { this(id, classes); _attributes(attributes); this.content(content); }
	 this(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { this(id, classes); _attributes(attributes); this.content(content); }
	 this(string id, string[] classes, string[string] attributes, DH5 content) { this(id, classes); _attributes(attributes); this.content(content); }
	
	 this(string[] classes) { this(); this.classes(classes); }
	 this(string[] classes, string content) { this(classes); this.content(content); }
	 this(string[] classes, DH5Obj[] content...) { this(classes); this.content(content); }
	 this(string[] classes, DH5 content) { this(classes); this.content(content); }
	
	 this(string[] classes, string[string] attributes) { this(classes); _attributes(attributes); }
	 this(string[] classes, string[string] attributes, string content) { this(classes, attributes); this.content(content); }
	 this(string[] classes, string[string] attributes, DH5Obj[] content...) { this(classes, attributes); this.content(content); }
	 this(string[] classes, string[string] attributes, DH5 content) { this(classes, attributes); this.content(content); }
	
	 this(string[string] attributes) { this(); _attributes(attributes); }
	 this(string[string] attributes, string content) { this(attributes); this.content(content); }
	 this(string[string] attributes, DH5Obj[] content...) { this(attributes); this.content(content); }
	 this(string[string] attributes, DH5 content) { this(attributes); this.content(content); }

//	this(DH5Obj[] content...) { this(); this.content(content); }
	
	 public void _init() {
		 _css = null;
		_classes = null;
		_attributes = new DMapString;
		_html = [];
		 _js = null;
	}
	
	mixin(TProperty!("bool", "single", "false"));
	mixin(TProperty!("string", "tag"));
	mixin(TProperty!("string", "id"));
	mixin(TProperty!("string", "css"));
	mixin(TProperty!("DH5Obj[]", "html"));

	protected string[] _js; 
	@property string js(this O)() { return _js.join(""); }
	O js(this O)(string[] codes...) { foreach(c; codes) _js ~= c; return cast(O)this; }
	O js(this O)(DJS[] codes...) { foreach(c; codes) _js ~= c.toString; return cast(O)this; }

	string[] _classes;
	 O classes(this O)() { return _classes; }
	 O classes(this O)(string[] value...) { foreach(c; value) if (c.length > 0) _classes ~= c.strip; return cast(O)this; }

	DMapString _attributes;
	 auto attributes() { return _attributes; }
	 O attributes(this O)(string key, string value) { _attributes[key] = value; return cast(O)this; }
	 O attributes(this O)(string[string] values) { _attributes.add(values); return cast(O)this; }

	// Attributes
	string attribute(string name) { return _attributes[name]; }
	 O attribute(this O)(string name, string value) { if (value.length > 0) _attributes[name] = value; else _attributes.remove(name); return cast(O)this; }
	 O attribute(this O)(string name, bool value) { if (value) attribute(name, "true"); else _attributes.remove(name); return cast(O)this; }
//	O attribute(this O)(string[string] values) { foreach(k, v; values) _attributes[k] = v; return cast(O)this; }
	
	 O accesskey(this O)(string value) { if (value.length > 0) attributes["accesskey"] = value; return cast(O)this; }
	 O contenteditable(this O)(bool value) { if (value) attributes["contenteditable"] = "true"; return cast(O)this; }
	 O contextmenu(this O)(string value) { if (value.length > 0) attributes["contextmenu"] = value; return cast(O)this; }
	 O dir(this O)(string value) { if (value.length > 0) attributes["dir"] = value; return cast(O)this; }
	 O draggable(this O)(bool value) { if (value) attributes["draggable"] = "true"; return cast(O)this; }
	 O dropzone(this O)(string value) { if (value.length > 0) attributes["dropzone"] = value; return cast(O)this; }
	 O hidden(this O)(bool value) { if (value) attributes["hidden"] = "true"; return cast(O)this; }
	 O lang(this O)(string value) { if (value.length > 0) attributes["lang"] = value; return cast(O)this; }
	 O spellcheck(this O)(bool value) { if (value) attributes["spellcheck"] = "true"; return cast(O)this; }
	 O style(this O)(string value) { if (value.length > 0) attributes["style"] = value; return cast(O)this; }
	 O tabindex(this O)(string value) { if (value.length > 0) attributes["tabindex"] = value; return cast(O)this; }
	 O title(this O)(string value) { if (value.length > 0) attributes["title"] = value; return cast(O)this; }
	 O translate(this O)(bool value) { if (value) attributes["translate"] = "true"; return cast(O)this; }

	override bool opEquals(Object value) { return super.opEquals(value); }

	bool opEquals(string html) { return toString == html; }
	bool opEquals(DH5Obj value) { return toString == value.toString; }

	void opIndexAssign(T)(T value, string key) { _attributes[key] = "%s".format(value); }
	void opIndexAssign(bool value, string key) { _attributes[key] = "%s".format((value) ? "true" : "false"); }
	void opIndexAssign(T)(T value, string key, T notValue) { if (value != notValue) _attributes[key] = "%s".format(value); }
	void opIndexAssign(bool value, string key, bool notValue) { if (value != notValue) _attributes[key] = "%s".format((value) ? "true" : "false");  }

	string opBinary(string op)(string rhs) {
		static if (op == "~") return toString ~ rhs;
		else return null;
	}
	 string opBinary(string op)(DH5Obj rhs) {
		static if (op == "~") return toString ~ rhs.toString;
		else return null;
	}

	 O content(this O)(string addContent) { _html ~= H5String(addContent); return cast(O)this; }
	 O content(this O)(DH5Obj[] addContent...) { foreach(c; addContent) _html ~= c; return cast(O)this; }
	 O content(this O)(DH5 addContent) { _html ~= addContent.objs; return cast(O)this; }
	
	 O opCall(this O)(string[] someClasses) { add(someClasses); return cast(O)this; }
	 O opCall(this O)(string[string] someAttributes) { add(someAttributes); return cast(O)this; }
	 O opCall(this O)(string[] someContent...) { foreach(c; someContent) add(c); return cast(O)this; }
	 O opCall(this O)(DH5Obj[] someContent...) { add(someContent); return cast(O)this; }
	 O opCall(this O)(DH5Obj[] someContent) { add(someContent); return cast(O)this; }
	 O opCall(this O)(DH5 someContent) { add(someContent.objs); return cast(O)this; }
	 O opCall(this O)(DJS code) { this.js(code); return cast(O)this; }

	 O add(this O)(string[] someClasses) { _classes.add(someClasses); return cast(O)this; }
	 O add(this O)(string[string] someAttributes) { _attributes.add(someAttributes); return cast(O)this; }
	 O add(this O)(string someContent) { _html ~= H5String(someContent); return cast(O)this; }
	 O add(this O)(DH5Obj[] someContent...) { foreach(c; someContent) _html ~= c; return cast(O)this; }
	 O add(this O)(DH5Obj[] someContent) { foreach(c; someContent) _html ~= c; return cast(O)this; }
	 O add(this O)(DH5 someContent) { _html ~= someContent.objs; return cast(O)this; }

	 O clear(this O)() { 
		_css = "";
		_html = [];
		_js = "";
		return cast(O)this;
	}
	 O clearCss(this O)() { 
		_css = "";
		return cast(O)this;
	}
	 O clearContent(this O)() { 
		_html = [];
		return cast(O)this;
	}
	 O clearHtml(this O)() { 
		_html = [];
		return cast(O)this;
	}
	 O clearJs(this O)() { 
		_js = "";
		return cast(O)this;
	}
	/* accesskey - specifies a shortcut key to activate/focus an element. */
	//	mixin(H5Attribute("accesskey"));
	//	// className (class) - Specifies one or more classnames for an element (refers to a class in a style sheet)
	//	mixin(H5Attribute("className", "class"));
	//
	//	// contenteditable - Specifies whether the content of an element is editable or not
	//	mixin(H5BoolAttribute("contenteditable"));
	//
	//	// contextmenu -	Specifies a context menu for an element. The context menu appears when a user right-clicks on the element
	//	mixin(H5Attribute("contextmenu"));
	
	//					data-* 	Used to store custom data private to the page or application
	//						dir 	Specifies the text direction for the content in an element
	//							draggable 	Specifies whether an element is draggable or not
	//								dropzone 	Specifies whether the dragged data is copied, moved, or linked, when dropped
	//								hidden 	Specifies that an element is not yet, or is no longer, relevant
	//								id 	Specifies a unique id for an element
	//									lang 	Specifies the language of the element's content
	//spellcheck 	Specifies whether the element is to have its spelling and grammar checked or not
	//style 	Specifies an inline CSS style for an element
	//tabindex 	Specifies the tabbing order of an element
	//title 	Specifies extra information about an element
	//translate 	Specifies whether the content of an element should be translated or not
	
	
	//	@property JS js() { return _js; }
	//	@property DH5Obj html() { return _html; }
	//	@property DCSS css() { return _css; }


	 bool isBoolAttribute(string name) {
		if (name in [
				"async":true, 
				"autocomplete":true, 
				"autofocus":true, 
				"autoplay":true, 
				"border":true, 
				"challenge":true, 
				"checked":true, 
				"compact":true, 
				"contenteditable":true, 
				"controls":true, 
				"default":true,
				"defer":true,
				"disabled":true,
				"formNoValidate":true,
				"frameborder":true,
				"hidden":true,
				"indeterminate":true,
				"ismap":true,
				"loop":true,
				"multiple":true,
				"muted":true,
				"nohref":true,
				"noresize":true,
				"noshade":true,
				"novalidate":true,
				"nowrap":true,
				"open":true,
				"readonly":true,
				"required":true,
				"reversed":true, 
				"scoped":true,
				"scrolling":true,
				"seamless":true,
				"selected":true,
				"sortable":true,
				"spellcheck":true,
				"translate":true]) return true; 
		return false;
	}

	 string attsToHTML() {
		string[] items;
		foreach(key; _attributes.keys.sort) {
			switch(key.toLower) {
				case "id":
				case "class": break;
				default: 
					if (isBoolAttribute(key)) items~=key;
					else items~=key~`="`~_attributes[key]~`"`;
					break;
			}
		}
		return " "~items.join(" ");
	}

	 string toCSS() {
		if (_css.length > 0) return doubleTag("style", _css);
		return null;
	}
	 string toHTML() {
		string result;

		// firstTag
		result ~= "<"~_tag;

		if (_id.length == 0) _id = _attributes["id"];
		if (_id.length > 0) result ~= ` id="`~_id~`"`;

		if (_classes.empty) _classes = _attributes["class"].split(" ");
		if (!_classes.empty) {
			string[] cls;
			foreach(c; _classes.unique.sort) if (c.length > 0) cls ~= c.strip;
			result ~= ` class="`~cls.join(" ")~`"`;
		}

		if (!_attributes.empty) result ~= attsToHTML;
		result ~= ">";

		// secondTag
		if (!_single){
			string inner;
			foreach(h5; _html) inner ~= h5.toString;
			result ~= inner~endTag(_tag);
		}
		return result;
	}
	 string toJS() {
		if (_js.length > 0) return doubleTag("script", this.js);
		return null;
	}
	 override string toString() {
		string result;
		result ~= toCSS;
		result ~= toHTML;
		result ~= toJS;
		return result;
	}
}
 auto H5Obj(string content) { return new DH5Obj(content); }
 auto H5Obj(DH5Obj content...) { return new DH5Obj(content); }

 auto H5Obj(string id, string[] classes) { return new DH5Obj(id, classes); }
 auto H5Obj(string id, string[] classes, string content) { return new DH5Obj(id, classes, content); }
 auto H5Obj(string id, string[] classes, DH5Obj content...) { return new DH5Obj(id, classes, content); }

 auto H5Obj(string id, string[string] attributes) { return new DH5Obj(id, attributes); }
 auto H5Obj(string id, string[string] attributes, string content) { return new DH5Obj(id, attributes, content); }
 auto H5Obj(string id, string[string] attributes, DH5Obj content...) { return new DH5Obj(id, attributes, content); }

 auto H5Obj(string id, string[] classes, string[string] attributes) { return new DH5Obj(id, classes, attributes); }
 auto H5Obj(string id, string[] classes, string[string] attributes, string content) { return new DH5Obj(id, classes, attributes, content); }
 auto H5Obj(string id, string[] classes, string[string] attributes, DH5Obj content...) { return new DH5Obj(id, classes, attributes, content); }

 auto H5Obj(string[] classes) { return new DH5Obj(classes); }
 auto H5Obj(string[] classes, string content) { return new DH5Obj(classes, content); }
 auto H5Obj(string[] classes, DH5Obj content...) { return new DH5Obj(classes, content); }

 auto H5Obj(string[] classes, string[string] attributes) { return new DH5Obj(classes, attributes); }
 auto H5Obj(string[] classes, string[string] attributes, string content) { return new DH5Obj(classes, attributes, content); }
 auto H5Obj(string[] classes, string[string] attributes, DH5Obj content...) { return new DH5Obj(classes, attributes, content); }

 auto H5Obj(string[string] attributes) { return new DH5Obj(attributes); }
 auto H5Obj(string[string] attributes, string content) { return new DH5Obj(attributes, content); }
 auto H5Obj(string[string] attributes, DH5Obj content...) { return new DH5Obj(attributes, content); }

unittest {
	auto h5 = H5Obj;
	assert(h5.id("newID").id == "newID");

	h5 = H5Obj("content");
	assert(H5Obj.id == null);
	assert(H5Obj(["classA", "classB"]).id == null);
	assert(H5Obj(["classA", "classB"], ["a":"x", "b":"y"]).id == null);
	assert(H5Obj(["classA", "classB"], ["a":"x", "b":"y"], "content1").id == null);
	assert(H5Obj(["a":"x", "b":"y"]).id == null);
	assert(H5Obj(["a":"x", "b":"y"], "content1").id == null);
}
