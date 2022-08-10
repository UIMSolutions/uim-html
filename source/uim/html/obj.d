﻿module uim.html.obj;

@safe:
import uim.html;

@safe:
class DH5Obj {
  this() { initialize; }

  this(string newContent)      { this().addContent(newContent); }
  this(string[] newClasses)    { this().addClasses(newClasses); }
  this(STRINGAA newAttributes) { this().addAttributes(newAttributes); }
  this(DH5Obj[] newContent...) { this().addContent(newContent); }
  this(DH5Obj[] newContent)    { this().addContent(newContent); }
  this(DH5 newContent)         { this().addContent(newContent); }

  this(string newId, DH5Obj[] newContent...) { this(newContent).id(newId); }
  this(string newId, DH5Obj[] newContent)    { this(newContent).id(newId); }
  this(string newId, DH5 newContent)         { this(newContent).id(newId); }

  this(string newId, string[] newClasses)    { this(newClasses).id(newId); }
  this(string newId, string[] newClasses, string newContent)      { this(newId, newClasses).addContent(newContent); }
  this(string newId, string[] newClasses, DH5Obj[] newContent...) { this(newId, newClasses).addContent(newContent); }
  this(string newId, string[] newClasses, DH5Obj[] newContent)    { this(newId, newClasses).addContent(newContent); }
  this(string newId, string[] newClasses, DH5 newContent)         { this(newId, newClasses).addContent(newContent); }
	
  this(string newId, STRINGAA newAttributes) { this(newAttributes).id(newId); }
  this(string newId, STRINGAA newAttributes, string newContent)      { this(newId, newAttributes).addContent(newContent); }
  this(string newId, STRINGAA newAttributes, DH5Obj[] newContent...) { this(newId, newAttributes).addContent(newContent); }
  this(string newId, STRINGAA newAttributes, DH5Obj[] newContent)    { this(newId, newAttributes).addContent(newContent); }
  this(string newId, STRINGAA newAttributes, DH5 newContent)         { this(newId, newAttributes).addContent(newContent); }
	
  this(string newId, string[] newClasses, STRINGAA newAttributes, string newContent)    { this().id(newId).classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string newId, string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent...) { this().id(newId).classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string newId, string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent)    { this().id(newId).classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string newId, string[] newClasses, STRINGAA newAttributes, DH5 newContent)         { this().id(newId).classes(newClasses).attributes(newAttributes).content(newContent); }
	
  this(string[] newClasses, string newContent)    { this().classes(newClasses).content(newContent); }
  this(string[] newClasses, DH5Obj[] newContent...) { this().classes(newClasses).content(newContent); }
  this(string[] newClasses, DH5Obj[] newContent)    { this().classes(newClasses).content(newContent); }
  this(string[] newClasses, DH5 newContent)         { this().classes(newClasses).content(newContent); }
	
  this(string[] newClasses, STRINGAA newAttributes, string newContent)    { this().classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent...) { this().classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent)    { this().classes(newClasses).attributes(newAttributes).content(newContent); }
  this(string[] newClasses, STRINGAA newAttributes, DH5 newContent)         { this().classes(newClasses).attributes(newAttributes).content(newContent); }
	
  this(STRINGAA newAttributes, string newContent)    { this().attributes(newAttributes).content(newContent); }
  this(STRINGAA newAttributes, DH5Obj[] newContent...) { this().attributes(newAttributes).content(newContent); }
  this(STRINGAA newAttributes, DH5Obj[] newContent)    { this().attributes(newAttributes).content(newContent); }
  this(STRINGAA newAttributes, DH5 newContent)         { this().attributes(newAttributes).content(newContent); }
	
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

	// Work with single Attribute
	string attribute(string name) { return (name in _attributes? _attributes[name] :""); }
	O attribute(this O)(string name, string value) { _attributes[name] = value; return cast(O)this; }
	O attribute(this O)(string name, bool value) { if (value) attribute(name, "true"); else attribute(name, "false"); return cast(O)this; }
	O removeAttribute(this O)(string name) { _attributes.remove(name); return cast(O)this; }

	// Global HTML attributes	
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

	// TODO correct?
	string opBinary(string op)(string rhs) {
		static if (op == "~") return toString ~ rhs;
		else return null;
	}
	 string opBinary(string op)(DH5Obj rhs) {
		static if (op == "~") return toString ~ rhs.toString;
		else return null;
	}

	// Get content - Always array of DH5Obj 
	DH5Obj[] content() { return _html; }

	// Setting content
	O content(this O)(string newContent)    { this.content([newContent]); return cast(O)this; }
	O content(this O)(string[] newContent)    { this.content(newContent.map!(c => cast(DH5Obj)H5String(c)).array); return cast(O)this; }
	O content(this O)(DH5Obj[] newContent...) { this.content(newContent); return cast(O)this; }
	O content(this O)(DH5Obj[] newContent) { _html = newContent.filter!(a => a !is null).map!(a => cast(DH5Obj)a).array; return cast(O)this; }
	O content(this O)(DH5 newContent) { _html ~= newContent.objs; return cast(O)this; }

	// Changing content
	O addContent(this O)(string newContent) { this.addContent([newContent]); return cast(O)this; }
	O addContent(this O)(string[] newContent) { this.addContent(newContent.filter!(c => c.length > 0).map!(c => cast(DH5Obj)H5String(c)).array); return cast(O)this; }
	O addContent(this O)(DH5Obj[] newContent...) { this.addContent(newContent); return cast(O)this; }
	O addContent(this O)(DH5Obj[] newContent) { _html ~= newContent.filter!(a => a !is null).map!(a => cast(DH5Obj)a).array; return cast(O)this; }
	O addContent(this O)(DH5 newContent) { _html ~= newContent.objs; return cast(O)this; }

	// Clear content
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

	// Using OpCalls is adding, not setting
	O opCall(this O)(string newContent) { addContent(newContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses) { addClasses(someClasses); return cast(O)this; }
	O opCall(this O)(string[] someClasses, string newContent)      { this(someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, string[] newContent)    { this(someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, DH5Obj[] newContent...) { this(someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, DH5Obj[] newContent)    { this(someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA newAttributes) { this(someClasses).add(someAttributes); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA newAttributes, string newContent)       { this(someClasses, newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA newAttributes, string[] someContent)    { this(someClasses, newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA newAttributes, DH5Obj[] someContent...) { this(someClasses, newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(string[] someClasses, STRINGAA newAttributes, DH5Obj[] someContent)    { this(someClasses, newAttributes).addContent(newContent); return cast(O)this; }

	O opCall(this O)(STRINGAA newAttributes) { add(someAttributes); return cast(O)this; }
	O opCall(this O)(STRINGAA newAttributes, string newContent)      { this(newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(STRINGAA newAttributes, string[] newContent)    { this(newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(STRINGAA newAttributes, DH5Obj[] newContent...) { this(newAttributes).addContent(newContent); return cast(O)this; }
	O opCall(this O)(STRINGAA newAttributes, DH5Obj[] newContent)    { this(newAttributes).addContent(newContent); return cast(O)this; }
  
	O opCall(this O)(string newContent)      { this.addContent(newContent); return cast(O)this; }
	O opCall(this O)(string[] newContent)    { this.addContent(newContent); return cast(O)this; }
	O opCall(this O)(DH5Obj[] newContent...) { this.addContent(newContent); return cast(O)this; }
	O opCall(this O)(DH5Obj[] newContent)    { this.addContent(newContent); return cast(O)this; }

	O opCall(this O)(string newId, string[] someClasses) { this.id(newId).addClasses(someClasses);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, string newContent)      { this(newId, someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, string[] newContent)    { this(newId, someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, DH5Obj[] newContent...) { this(newId, someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, DH5Obj[] newContent)    { this(newId, someClasses).addContent(newContent);    return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA newAttributes) { this(newId, someClasses).addattributes(newAttributes); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA newAttributes, string	O opCall(this O)(string newId, string[] someClasses, string newContent)      { this.id(newId).addClasses(someClasses).addContent(newContent);    return cast(O)this; }
Z) { this.id(newId).addClasses(someClasses).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA newAttributes, string[] someContent)    { this.id(newId).addClasses(someClasses).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA newAttributes, DH5Obj[] someContent...) { this.id(newId).addClasses(someClasses).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, string[] someClasses, STRINGAA newAttributes, DH5Obj[] someContent)    { this.id(newId).addClasses(someClasses).addattributes(newAttributes).addContent(someContent); return cast(O)this; }

	O opCall(this O)(string newId, STRINGAA newAttributes) { this.id(newId).add(someAttributes); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA newAttributes, string[] someContent...) { this.id(newId).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA newAttributes, string[] someContent)    { this.id(newId).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA newAttributes, DH5Obj[] someContent...) { this.id(newId).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
	O opCall(this O)(string newId, STRINGAA newAttributes, DH5Obj[] someContent)    { this.id(newId).addattributes(newAttributes).addContent(someContent); return cast(O)this; }
  
	O opCall(this O)(string newId, DH5Obj aContent, DH5Obj[] someContent...) { this.id(newId).addContent(aContent~someContent); return cast(O)this; }
	O opCall(this O)(string newId, DH5Obj[] someContent)    { this.id(newId).addContent(someContent); return cast(O)this; }

	O opCall(this O)(DH5 someContent) { add(someContent.objs); return cast(O)this; }
	O opCall(this O)(DJS code) { this.js(code); return cast(O)this; }

	O add(this O)(string[] someClasses) { _classes = _classes.add(someClasses); return cast(O)this; }
	O add(this O)(STRINGAA newAttributes) { _attributes.add(someAttributes); return cast(O)this; }
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
auto H5Obj() { return new DH5Obj(); }

auto H5Obj(string[] newClasses...) { return H5Obj(newClasses); }
auto H5Obj(string[] newClasses)    { return H5Obj.addClasses(newClasses); }
auto H5Obj(STRINGAA newAttributes) { return H5Obj.addAttributes(newAttributes); }
auto H5Obj(string newContent)      { return H5Obj.addContent(newContent); }
auto H5Obj(DH5Obj[] newContent...) { return H5Obj(newContent); }
auto H5Obj(DH5Obj[] newContent)    { return H5Obj.addContent(newContent); }
auto H5Obj(DH5 newContent) 				 { return H5Obj.addContent(newContent); }

auto H5Obj(string newId, string[] newClasses) { return new DH5Obj(newId, newClasses); }
auto H5Obj(string newId, string[] newClasses, string newContent)      { return H5Obj(newId, newClasses).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, DH5Obj[] newContent...) { return H5Obj(newId, newClasses).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, DH5Obj[] newContent)    { return H5Obj(newId, newClasses).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, DH5 newContent) 			  { return H5Obj(newId, newClasses).addContent(newContent); }

auto H5Obj(string newId, STRINGAA newAttributes) { return new DH5Obj(newId, attributes); }
auto H5Obj(string newId, STRINGAA newAttributes, string newContent)      { return H5Obj(newId, newattributes).addContent(newContent); }
auto H5Obj(string newId, STRINGAA newAttributes, DH5Obj[] newContent...) { return H5Obj(newId, newattributes).addContent(newContent); }
auto H5Obj(string newId, STRINGAA newAttributes, DH5Obj[] newContent)    { return H5Obj(newId, newattributes).addContent(newContent); }
auto H5Obj(string newId, STRINGAA newAttributes, DH5 newContent)         { return H5Obj(newId, newattributes).addContent(newContent); }

auto H5Obj(string newId, string[] newClasses, STRINGAA newAttributes) { return new DH5Obj(id, classes, attributes); }
auto H5Obj(string newId, string[] newClasses, STRINGAA newAttributes, string newContent)      { return H5Obj(newId, newClasses, attributes).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent...) { return H5Obj(newId, newClasses, attributes).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent)    { return H5Obj(newId, newClasses, attributes).addContent(newContent); }
auto H5Obj(string newId, string[] newClasses, STRINGAA newAttributes, DH5 newContent) 				{ return H5Obj(newId, newClasses, attributes).addContent(newContent); }

auto H5Obj(string[] newClasses) { return new DH5Obj(classes); }
auto H5Obj(string[] newClasses, string newContent)      { return H5Obj(newClasses).addContent(newContent); }
auto H5Obj(string[] newClasses, DH5Obj[] newContent...) { return H5Obj(newClasses).addContent(newContent); }
auto H5Obj(string[] newClasses, DH5Obj[] newContent)    { return H5Obj(newClasses).addContent(newContent); }
auto H5Obj(string[] newClasses, DH5 newContent) 				{ return H5Obj(newClasses).addContent(newContent); }

auto H5Obj(string[] newClasses, STRINGAA newAttributes) { return new DH5Obj(classes, attributes); }
auto H5Obj(string[] newClasses, STRINGAA newAttributes, string newContent)      { return H5Obj(newClasses, newAttributes).addContent(newContent); }
auto H5Obj(string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent...) { return H5Obj(newClasses, newAttributes).addContent(newContent); }
auto H5Obj(string[] newClasses, STRINGAA newAttributes, DH5Obj[] newContent)    { return H5Obj(newClasses, newAttributes).addContent(newContent); }
auto H5Obj(string[] newClasses, STRINGAA newAttributes, DH5 newContent) 			  { return H5Obj(newClasses, newAttributes).addContent(newContent); }

auto H5Obj(STRINGAA newAttributes) { return new DH5Obj(newAttributes); }
auto H5Obj(STRINGAA newAttributes, string newContent)      { return H5Obj(attributes).addContent(newContent); }
auto H5Obj(STRINGAA newAttributes, DH5Obj[] newContent...) { return H5Obj(attributes).addContent(newContent); }
auto H5Obj(STRINGAA newAttributes, DH5Obj[] newContent)    { return H5Obj(attributes).addContent(newContent); }
auto H5Obj(STRINGAA newAttributes, DH5 newContent) 				 { return H5Obj(attributes).addContent(newContent); }

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