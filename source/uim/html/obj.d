module uim.html.obj;

@safe:
import uim.html;

@safe:
class DH5Obj {
	 this() { initialize; }
	 this(string content) { this().content(content); }
	 this(DH5Obj[] content...) { this().content(content); }
	 this(DH5Obj[] content) { this().content(content); }
	 this(DH5 content) { this().content(content); }
	
	 this(string id, string content) { this().id(id).content(content); }
	 this(string id, DH5Obj[] content...) { this().id(id).content(content); }
	 this(string id, DH5Obj[] content) { this().id(id).content(content); }
	 this(string id, DH5 content) { this().id(id).content(content); }

	 this(string id, string[] classes) { this().id(id).classes(classes); }
	 this(string id, string[] classes, string content) { this(id, classes).content(content); }
	 this(string id, string[] classes, DH5Obj[] content...) { this(id, classes).content(content); }
	 this(string id, string[] classes, DH5Obj[] content) { this(id, classes).content(content); }
	 this(string id, string[] classes, DH5 content) { this(id, classes).content(content); }
	
	 this(string id, STRINGAA someAttributes) { this().id(id).attributes(someAttributes); }
	 this(string id, STRINGAA someAttributes, string content) { this(id, someAttributes).content(content); }
	 this(string id, STRINGAA someAttributes, DH5Obj[] content...) { this(id, someAttributes).content(content); }
	 this(string id, STRINGAA someAttributes, DH5Obj[] content) { this(id, someAttributes).content(content); }
	 this(string id, STRINGAA someAttributes, DH5 content) { this(id, someAttributes).content(content); }
	
	 this(string id, string[] classes, STRINGAA someAttributes) { this(id, classes).attributes(someAttributes); }
	 this(string id, string[] classes, STRINGAA someAttributes, string content) { this(id, classes).attributes(someAttributes).content(content); }
	 this(string id, string[] classes, STRINGAA someAttributes, DH5Obj[] content...) { this(id, classes).attributes(someAttributes).content(content); }
	 this(string id, string[] classes, STRINGAA someAttributes, DH5Obj[] content) { this(id, classes).attributes(someAttributes).content(content); }
	 this(string id, string[] classes, STRINGAA someAttributes, DH5 content) { this(id, classes).attributes(someAttributes).content(content); }
	
	 this(string[] classes) { this().classes(classes); }
	 this(string[] classes, string content) { this(classes).content(content); }
	 this(string[] classes, DH5Obj[] content...) { this(classes).content(content); }
	 this(string[] classes, DH5Obj[] content) { this(classes).content(content); }
	 this(string[] classes, DH5 content) { this(classes).content(content); }
	
	 this(string[] classes, STRINGAA someAttributes) { this(classes).attributes(someAttributes); }
	 this(string[] classes, STRINGAA someAttributes, string content) { this(classes, someAttributes).content(content); }
	 this(string[] classes, STRINGAA someAttributes, DH5Obj[] content...) { this(classes, someAttributes).content(content); }
	 this(string[] classes, STRINGAA someAttributes, DH5Obj[] content) { this(classes, someAttributes).content(content); }
	 this(string[] classes, STRINGAA someAttributes, DH5 content) { this(classes, someAttributes).content(content); }
	
	 this(STRINGAA someAttributes) { this().attributes(someAttributes); }
	 this(STRINGAA someAttributes, string content) { this(someAttributes).content(content); }
	 this(STRINGAA someAttributes, DH5Obj[] content...) { this(someAttributes).content(content); }
	 this(STRINGAA someAttributes, DH5Obj[] content) { this(someAttributes).content(content); }
	 this(STRINGAA someAttributes, DH5 content) { this(someAttributes).content(content); }

//	this(DH5Obj[] content...) { this().content(content); }
	
	 void initialize() {
		_css = CSSRules;
		_classes = null;
		_attributes = null;
		_html = [];
		_js = null;
	}
	
	mixin(OProperty!("bool", "single", "false"));
	mixin(OProperty!("string", "tag"));
	mixin(OProperty!("string", "id"));
	mixin(OProperty!("DH5Obj[]", "html"));

	protected string _js; 
	@property string js() { return _js; }
	O js(this O)(string[] codes...) { foreach(c; codes) _js ~= c; return cast(O)this; }
	O js(this O)(DJS[] codes...) { foreach(c; codes) _js ~= c.toString; return cast(O)this; }

	/// classes of HTML element
	protected string[] _classes;
	auto classes() { return _classes.sort.array; }
	O classes(this O)(string[] values...) { this.classes(values); return cast(O)this; }
	O classes(this O)(string[] values) { _classes ~= values; _classes = uniq(_classes).array; return cast(O)this; }
	O addClasses(this O)(string[] values...) { this.addClasses(values); return cast(O)this; }
	O addClasses(this O)(string[] values) { _classes ~= values; _classes = uniq(_classes).array; return cast(O)this; }
	O removeClasses(this O)(string[] values...) { this.removeClasses(values); return cast(O)this; }
	O removeClasses(this O)(string[] values) { foreach(value; values) _classes = _classes.filter!(a => value.length > 0 && a != value).array; return cast(O)this; }
	O clearClasses(this O)() { _classes = []; return cast(O)this; }

	/// Attributes of HTML element
	mixin(XStringAA!"attributes");
	O addAttributes(this O)(STRINGAA newAttributes) {
		foreach(k, v; newAttributes) { _attributes[k] = v; }
		return cast(O)this;
	}
	unittest {
		assert(H5Obj.attributes(["a": "b"]).attributes == ["a": "b"]); 
	}

	// Attribute
	string attribute(string name) { return (name in _attributes? _attributes[name] :""); }
	O attribute(this O)(string name, string value) { _attributes[name] = value; return cast(O)this; }
	O attribute(this O)(string name, bool value) { if (value) attribute(name, "true"); else attribute(name, "false"); return cast(O)this; }
	O removeAttribute(this O)(string name) { _attributes.remove(name); return cast(O)this; }
	
//	O attribute(this O)(STRINGAA values) { foreach(k, v; values) _attributes[k] = v; return cast(O)this; }
	
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

//	Should be @safe ...bool opEquals(DH5Obj value) { return (this == value); }
	bool opEquals(string html) { return (toString == html); }

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

	DH5Obj[] content() { return _html; }
	O content(this O)(string addContent) { _html ~= H5String(addContent); return cast(O)this; }
	O content(this O)(DH5Obj[] addContent...) { this.content(addContent); return cast(O)this; }
	O content(this O)(DH5Obj[] addContent) { _html ~= addContent.filter!(a => a !is null).array; return cast(O)this; }
	O content(this O)(DH5 addContent) { _html ~= addContent.objs; return cast(O)this; }

	O addContent(this O)(string[] newContent...) { this.addContent(newContent); return cast(O)this; }
	O addContent(this O)(string[] newContent) { this.addContent(newContent.filter!(c => c.length > 0).map!(c => cast(DH5Obj)H5String(c)).array); return cast(O)this; }
	O addContent(this O)(DH5Obj[] newContent...) { this.addContent(newContent); return cast(O)this; }
	O addContent(this O)(DH5Obj[] newContent) { _html ~= newContent.filter!(a => a !is null).array; return cast(O)this; }
	O addContent(this O)(DH5 newContent) { _html ~= newContent.objs; return cast(O)this; }

	O clearContent(this O)() { _html = []; return cast(O)this; }
	
	DCSSRules _css;
	DCSSRules css() { return _css; }
	O clearCss(this O)() { _css = CSSRules; return cast(O)this; }
	O css(this O)(string aSelector, string name, string value) { return this.css(CSSRule(aSelector, name, value)); }
	O css(this O)(string aSelector, STRINGAA someDeclarations) { return this.css(CSSRule(aSelector, someDeclarations)); }
	O opCall(this O)(DCSSRule aRule) { return this.css(aRule); }
	O opCall(this O)(DCSSRules aRules) { return this.css(aRules);  }
	O css(this O)(DCSSRule aRule) { _css(aRule); return cast(O)this; }
	O css(this O)(DCSSRules aRules) { _css(aRules); return cast(O)this; }

	O opCall(this O)(string[] someClasses) { add(someClasses); return cast(O)this; }
	O opCall(this O)(string[] someClasses, string[] someContent...) { this(someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, DH5Obj[] someContent...) { this(someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, DH5Obj[] someContent)    { this(someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA someAttributes) { this(someClasses).add(someAttributes); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA someAttributes, string[] someContent...) { this(someClasses, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA someAttributes, DH5Obj[] someContent...) { this(someClasses, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA someAttributes, DH5Obj[] someContent)    { this(someClasses, someAttributes).add(someContent); return cast(O)this; }

	O opCall(this O)(STRINGAA someAttributes) { add(someAttributes); return cast(O)this; }
	O opCall(this O)(STRINGAA someAttributes, string[] someContent...) { this(someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(STRINGAA someAttributes, DH5Obj[] someContent...) { this(someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(STRINGAA someAttributes, DH5Obj[] someContent)    { this(someAttributes).add(someContent); return cast(O)this; }
  
	O opCall(this O)(string[] someContent...) { foreach(c; someContent) add(c); return cast(O)this; }
	O opCall(this O)(DH5Obj[] someContent...) { add(someContent); return cast(O)this; }
	O opCall(this O)(DH5Obj[] someContent)    { add(someContent); return cast(O)this; }

	O opCall(this O)(string newId, string[] someClasses) { this.id(newid).add(someClasses); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, string[] someContent...) { this(newid, someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, DH5Obj[] someContent...) { this(newid, someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, DH5Obj[] someContent)    { this(newid, someClasses).add(someContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA someAttributes) { this(newid, someClasses).add(someAttributes); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA someAttributes, string[] someContent...) { this(newid, someClasses, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA someAttributes, DH5Obj[] someContent...) { this(newid, someClasses, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA someAttributes, DH5Obj[] someContent)    { this(newid, someClasses, someAttributes).add(someContent); return cast(O)this; }

	O opCall(this O)(string newId, STRINGAA someAttributes) { this.id(newid).add(someAttributes); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA someAttributes, string[] someContent...) { this(newid, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA someAttributes, DH5Obj[] someContent...) { this(newid, someAttributes).add(someContent); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA someAttributes, DH5Obj[] someContent)    { this(newid, someAttributes).add(someContent); return cast(O)this; }
  
	O opCall(this O)(string newId, string[] someContent...) { this.id(newid); foreach(c; someContent) add(c); return cast(O)this; }
	O opCall(this O)(string newId, DH5Obj[] someContent...) { this(newid).add(someContent); return cast(O)this; }
	O opCall(this O)(string newId, DH5Obj[] someContent)    { this(newid).add(someContent); return cast(O)this; }

	O opCall(this O)(DH5 someContent) { add(someContent.objs); return cast(O)this; }
	O opCall(this O)(DJS code) { this.js(code); return cast(O)this; }

	O add(this O)(string[] someClasses) { _classes = _classes.add(someClasses); return cast(O)this; }
	O add(this O)(STRINGAA someAttributes) { _attributes.add(someAttributes); return cast(O)this; }
	O add(this O)(string someContent) { _html ~= H5String(someContent); return cast(O)this; }
	O add(this O)(DH5Obj[] someContent...) { foreach(c; someContent) _html ~= c; return cast(O)this; }
	O add(this O)(DH5Obj[] someContent) { foreach(c; someContent) _html ~= c; return cast(O)this; }
	O add(this O)(DH5 someContent) { _html ~= someContent.objs; return cast(O)this; }

	 O clear(this O)() { 
		_css = CSSRules;
		_html = [];
		_js = "";
		return cast(O)this;
	}
	O clearHtml(this O)() { _html = []; return cast(O)this; }
	O clearJs(this O)() { _js = ""; return cast(O)this; }

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
		foreach(key; _attributes.byKey.array.sort!("a < b")) {
			switch(key.toLower) {
				case "id":
					this.id(_attributes[key]); 
					_attributes.remove(key);
					break;
				case "class": 
					this.classes(_attributes[key].split(" ")); 
					_attributes.remove(key);
					break;
				default: 
					if (isBoolAttribute(key)) items~=key;
					else items~=key~`="`~_attributes[key]~`"`;
					break;
			}
		}
		return " "~items.join(" ");
	}

  DH5Obj copy() {
    auto result = H5Obj(
      id.dup,
      classes.dup,
      attributes.dup,
      content.dup
    );
/*     .css(CSSRules.dup)
    .js(this.js.dup);
 */
    return H5Obj;
  }	

  DH5Obj clone() {
    auto result = H5Obj(
      id~to!string(uniform(1, 10_000)),
      classes.dup,
      attributes.dup,
      content.dup
    );
/*     .css(CSSRules.dup)
    .js(this.js.dup);
 */
    return H5Obj;
  }	

	string onlyCSS() {
		if (auto result = _css.toString) return doubleTag("style", result);
		return null;
	}
	 string onlyHTML() {
		string first;
		string attsHTML = attsToHTML;
		// firstTag
		first ~= "<"~_tag;

		if (_id.length > 0) first ~= ` id="`~_id~`"`;

		if (_classes) {
			string[] cls;
			foreach(c; _classes.unique.sort) if (c.length > 0) cls ~= c.strip;
			first ~= ` class="`~cls.join(" ")~`"`;
		}

		if (_attributes) first ~= attsHTML;
		first ~= ">";
		if (_single) return first;

		return first~_html.toString~endTag(_tag);
	}
	 string onlyJS() {
		if (_js.length > 0) return doubleTag("script", this.js);
		return null;
	}
	override string toString() {
    return toString(null);
  }
	string toString(STRINGAA parameters) {
		string result;
		result ~= onlyCSS;
		result ~= onlyHTML;
		result ~= onlyJS;
		return result;
	}

	string toJS(string target = null) {
		auto result = jsCreateElement(target, _tag, _classes, _attributes); //, _html.toString); // Not finish TODO
		foreach(index, h5; _html) {
      if (h5) {
        auto node = "child"~to!string(index);
        if (cast(DH5String)h5) result ~= "let "~node~"=document.createTextNode('"~h5.toString.replace("'", "\\'")~"');"; 
        else result ~= h5.toJS(node);
        result ~= target~".appendChild("~node~");";
      }
		}
		return result;
	}

	/// generate HTML in pretty format
	string toPretty(int intendSpace = 0, int step = 2) {
		string result;
		result = startTag(this.tag, this.attributes).indent(intendSpace);
		if (!single) {
			result ~= "\n";
			result ~= _html.map!(a => a ? a.toPretty(intendSpace+step, step)~"\n" : "").join;
			result ~= endTag(this.tag).indent(intendSpace);
		}
		return result;
	}
	unittest {
		/*
		writeln(H5Obj.tag("div").toPretty);
		writeln("---------");
		writeln(H5Obj.tag("div")(H5Obj.tag("div")).toPretty);
		writeln("---------");
		writeln(H5Obj.tag("div")(H5Obj.tag("div")(H5Obj.tag("div"))).toPretty);
		*/
	}
}
auto H5Obj(string content) { return new DH5Obj(content); }
auto H5Obj(DH5Obj[] content...) { return new DH5Obj(content); }
auto H5Obj(DH5Obj[] content) { return new DH5Obj(content); }
auto H5Obj(DH5 content) { return new DH5Obj(content); }

auto H5Obj(string id, string[] classes) { return new DH5Obj(id, classes); }
auto H5Obj(string id, string[] classes, string content) { return new DH5Obj(id, classes, content); }
auto H5Obj(string id, string[] classes, DH5Obj[] content...) { return new DH5Obj(id, classes, content); }
auto H5Obj(string id, string[] classes, DH5Obj[] content) { return new DH5Obj(id, classes, content); }
auto H5Obj(string id, string[] classes, DH5 content) { return new DH5Obj(id, classes, content); }

auto H5Obj(string id, STRINGAA attributes) { return new DH5Obj(id, attributes); }
auto H5Obj(string id, STRINGAA attributes, string content) { return new DH5Obj(id, attributes, content); }
auto H5Obj(string id, STRINGAA attributes, DH5Obj[] content...) { return new DH5Obj(id, attributes, content); }
auto H5Obj(string id, STRINGAA attributes, DH5Obj[] content) { return new DH5Obj(id, attributes, content); }
auto H5Obj(string id, STRINGAA attributes, DH5 content) { return new DH5Obj(id, attributes, content); }

auto H5Obj(string id, string[] classes, STRINGAA attributes) { return new DH5Obj(id, classes, attributes); }
auto H5Obj(string id, string[] classes, STRINGAA attributes, string content) { return new DH5Obj(id, classes, attributes, content); }
auto H5Obj(string id, string[] classes, STRINGAA attributes, DH5Obj[] content...) { return new DH5Obj(id, classes, attributes, content); }
auto H5Obj(string id, string[] classes, STRINGAA attributes, DH5Obj[] content) { return new DH5Obj(id, classes, attributes, content); }
auto H5Obj(string id, string[] classes, STRINGAA attributes, DH5 content) { return new DH5Obj(id, classes, attributes, content); }

auto H5Obj(string[] classes) { return new DH5Obj(classes); }
auto H5Obj(string[] classes, string content) { return new DH5Obj(classes, content); }
auto H5Obj(string[] classes, DH5Obj[] content...) { return new DH5Obj(classes, content); }
auto H5Obj(string[] classes, DH5Obj[] content) { return new DH5Obj(classes, content); }
auto H5Obj(string[] classes, DH5 content) { return new DH5Obj(classes, content); }

auto H5Obj(string[] classes, STRINGAA attributes) { return new DH5Obj(classes, attributes); }
auto H5Obj(string[] classes, STRINGAA attributes, string content) { return new DH5Obj(classes, attributes, content); }
auto H5Obj(string[] classes, STRINGAA attributes, DH5Obj[] content...) { return new DH5Obj(classes, attributes, content); }
auto H5Obj(string[] classes, STRINGAA attributes, DH5Obj[] content) { return new DH5Obj(classes, attributes, content); }
auto H5Obj(string[] classes, STRINGAA attributes, DH5 content) { return new DH5Obj(classes, attributes, content); }

auto H5Obj(STRINGAA attributes) { return new DH5Obj(attributes); }
auto H5Obj(STRINGAA attributes, string content) { return new DH5Obj(attributes, content); }
auto H5Obj(STRINGAA attributes, DH5Obj[] content...) { return new DH5Obj(attributes, content); }
auto H5Obj(STRINGAA attributes, DH5Obj[] content) { return new DH5Obj(attributes, content); }
auto H5Obj(STRINGAA attributes, DH5 content) { return new DH5Obj(attributes, content); }

unittest {
	auto h5 = H5Obj;
	assert(h5.id("newID").id == "newID");

	// Test classes
  assert(H5Obj.classes(["a", "b"]).classes == ["a", "b"]); 
  assert(H5Obj.classes(["b", "a"]).classes == ["a", "b"]); 
  assert(H5Obj.classes("a", "b").classes == ["a", "b"]); 
  assert(H5Obj.classes("b", "a").classes == ["a", "b"]); 

	h5 = H5Obj("content");
	assert(H5Obj.id == null);
	assert(H5Obj(["classA", "classB"]).id == null);
	assert(H5Obj(["classA", "classB"], ["a":"x", "b":"y"]).id == null);
	assert(H5Obj(["classA", "classB"], ["a":"x", "b":"y"], "content1").id == null);
	assert(H5Obj(["a":"x", "b":"y"]).id == null);
	assert(H5Obj(["a":"x", "b":"y"], "content1").id == null);
}

string toPretty(DH5Obj[] objs, int intendSpace = 0, int step = 2) {
	return objs.map!(a => a ? a.toPretty : "").join;
}