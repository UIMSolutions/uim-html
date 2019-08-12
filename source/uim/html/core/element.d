module uim.html.core.element;

import uim.html;

template Classes() {
	const char[] Classes = `
	 string[] classes() { 
		if ("class" in attributes) return attributes["class"].split(" ").unique; 
		return null;
	}
	 @property O classes(this O)(string newClass) { return this.classes(newClass.split(" ").unique);  }
	 @property O classes(this O)(string[] someClasses) {
		if (classes) _attributes["class"] = (classes ~ someClasses).unique.join(" "); 
		else _attributes["class"] = someClasses.unique.join(" "); 
		return cast(O)this; 
	}
	
	 bool hasClasses(string[] someClasses) { foreach(c; someClasses) if (!hasClass(c)) return false; return true; }
	 bool hasClass(string className) { return classes.has(className); }
	
	 O addClasses(this O)(string[] someClasses) { this.classes(someClasses); return cast(O)this; }
	 O addClass(this O)(string newClass) { this.classes(newClass); return cast(O)this; }
	
	 O removeClass(this O)(string[] someClasses) { foreach(c; someClasses) removeClass(c); return cast(O)this; }
	 O removeClass(this O)(string className) { if (hasClass(className)) classes = std.algorithm.mutation.remove(classes, className); return cast(O)this; }
	
	 O toggleClass(this O)(string[] someClasses) { foreach(c; someClasses) toggleClass(c); return cast(O)this; }
	 O toggleClass(this O)(string className) { if (hasClass(className)) removeClass(className); else addClass(className); return cast(O)this; }
	`;
}

enum ShowMode { standard, onlyHTML, onlyJS, onlyCSS }

////alias HAADelegate = DH5Element delegate(string[string] atts);  
////alias HAASDelegate = DH5Element delegate(string[string] atts, string[] values...);  
//////alias HAAHDelegate = DH5Element delegate(string[string] atts, DOPObject[] values...);  
////
////alias HAADelegateAA = HAADelegate[string];
////alias HAASDelegateAA = HAASDelegate[string];
////// alias HAAHDelegateAA = HAAHDelegate[string];
//
//
//class DH5ElementTempl(string tagName) : DH5Obj {
//	// alias add = super.add;
//
//protected:
//	Random gen;
//
//	//	HAADelegateAA _HAADelegates;
//	//	HAASDelegateAA _HAASDelegates;
//	//	HAAHDelegateAA _HAAHDelegates;
//
//	STRINGAA _paras;
//	STRINGAA _parameters;
//	string[] _flags;
//
//	bool _doubleTag = true;
//	ShowMode showMode = ShowMode.standard;
//
//	DH5Obj _listener;
//
//public:
//	bool htmlFirst = true;
//
//	/*Universalattribute
//	 id
//	 class
//	 accesskey
//	 contenteditable
//	 contextmenu
//	 data-*
//	 dir
//	 draggable
//	 dropzone
//	 hidden
//	 itemprop
//	 lang
//	 spellcheck
//	 style
//	 tabindex
//	 */
//	
////	this() { this.tag = tagName; }
////	this(T...)(T elements) { this(); Add(elements); }
//
//	@property DH5Obj parameters(STRINGAA values) { 
//		foreach(k, v; values) _parameters[k] = v; 
//		return this; }
//
//	// class functions
//
//	DH5Obj parameter(string k, string v) { _parameters[k] = v; return this; }
//	@property STRINGAA paras() { return _paras; }
//	@property DH5Obj paras(STRINGAA values) { 
//		foreach(k, v; values) _paras[k] = v; return this; }
//
//	
//	// attribute methods
//	// has  - exists
//	bool has(string name) { if (attributes.hasKey(name)) return true; return false;  }
//	//	bool has(string name, DOPObject value) { if (has(name)) return has(name, value.toString); return false; }
//	bool has(string name, bool value)    { if (has(name)) return has(name, value ? "true" : "false"); return false;  }
//	bool has(string name, int value)     { if (has(name)) return has(name, to!string(value)); return false;  }
//	bool has(string name, double value)  { if (has(name)) return has(name, to!string(value)); return false;  }
//	bool has(string name, string value)  { if (has(name)) { foreach(v; this.attributes[name].split(" ")) if (v == value) return true; } return false; }
//
//	// set attributes
//	//	void set(DOPObject[string] values) { foreach(k, v; values) set(k, v); }		
//	void set(bool[string] values) { foreach(k, v; values) set(k, v); }		
//	void set(int[string] values) { foreach(k, v; values) set(k, v); }		
//	void set(double[string] values) { foreach(k, v; values) set(k, v); }		
//	void set(string[string] values) { foreach(k, v; values) set(k, v); }		
//	//	void set(T)(string name, T value, T defaultValue)  { if (value) { if (value != defaultValue) set(name, value); }}
//	//	void set(T, S)(string name, T value, T checkValue, S newValue)  { if (value) { if (value == checkValue) set(name, newValue); }}
//
//	//	void set(string name, DOPObject value) { if (value) set(name, value.toString); }
//	void set(string name, bool value)    { if (value) set(name, value ? "true" : "false"); }
//	void set(string name, int value)     { if (value) set(name, to!string(value)); }
//	void set(string name, double value)  { if (value) set(name, to!string(value)); }
//	void set(string name, string value = "")  { 
//		string n = name;
//		_attributes[n] = (value ? value : "");
//		switch(n) {
//			case "id": this.id(value); break;
//			default: break;
//		}
//	}
//
//	// put attributes
//	//	void put(DOPObject[string] values) { foreach(k, v; values) put(k, v); }	
//	void put(bool[string] values) { foreach(k, v; values) put(k, v); }	
//	void put(int[string] values) { foreach(k, v; values) put(k, v); }	
//	void put(double[string] values) { foreach(k, v; values) put(k, v); }	
//	void put(string[string] values) { foreach(k, v; values) _attributes[k] = v; }	
//
//	//	void put(string name, DOPObject value) { if (value) put(name, value.toString); }
//	void put(string name, bool value)    { if (value)put(name, value ? "true" : "false"); }
//	void put(string name, int value)     { if (value)put(name, to!string(value)); }
//	void put(string name, double value)  { if (value)put(name, to!string(value)); }
//	void put(string name, string value)  { 
//		string n = name.toLower;
//		if (has(n)) { // attribute exists
//			if (!has(n, (value ? value : ""))) {
//				auto vals = _attributes[n].split(" ");
//				vals ~= (value ? value : "");
//				_attributes[n] = vals.join(" ");
//			}
//		}
//		else set(n, value); 
//	}
//
//	// pop attribute values
//	//	void pop(DOPObject[string] values) { foreach(k, v; values) pop(k, v); }	
//	void pop(bool[string] values) { foreach(k, v; values) pop(k, v); }	
//	void pop(int[string] values) { foreach(k, v; values) pop(k, v); }	
//	void pop(double[string] values) { foreach(k, v; values) pop(k, v); }	
//	void pop(string[string] values) { foreach(k, v; values) pop(k, v); }	
//
//	//	void pop(T)(string name, T value, T defaultValue) { if (defaultValue != value) pop(name, value); }
//	//	void pop(string name, DOPObject value) { if (value) pop(name, value.toString); }
//	void pop(string name, bool value)    { if (value) pop(name, value ? "true" : "false"); }
//	void pop(string name, int value)     { if (value) pop(name, to!string(value)); }
//	void pop(string name, double value)  { if (value) pop(name, to!string(value)); }
//	void pop(string name, string value)  { if (value) {
//			if (has(name)) { // attribute exists
//				auto vals = _attributes[name].split(" ");
//				string[] newVals; foreach(v; vals) if (v != value) newVals ~= v;
//				_attributes[name] = newVals.join(" ");
//			}
//		}
//	}
//
//	O prepend(this O)(string content) { return cast(O)prepend(H5String(content)); }
//	O prepend(this O)(DObject content) { elements = content ~ elements; return cast(O)this; }
//
//	O append(this O)(string content) { return cast(O)append(H5String(content)); }
//	O append(this O)(DObject content) { elements ~= content; return cast(O)this; }
//
//	O html(this O)(string content) { return cast(O)html(H5String(content)); }
//	O html(this O)(DObject content) { elements = content; return cast(O)this; }
//
//	O text(this O)(DObject content) { return text(content.toString); }
//	O text(this O)(string content) { element = H5String(content
//			.replace("&", "&amp;").replace("\"", "&quot;").replace("'", "&#39;").replace("<", "&lt;").replace(">", "&gt;").replace("/", "&#x2F;")
//			); 
//		return cast(O)this; }
//
//	// replace attribute value
//	void replace(T)(string name, T oldValue, T newValue, bool putAlways = false) { 
//		if (has(name)) {
//			if (has(name, oldValue)) {
//				pop(name, oldValue);
//				put(name, newValue);
//			}
//			else if (putAlways) put(name, newValue);
//		}
//	}
//
//	// flag methods
//	// has  - exists
//	bool hasFlag(string flag) { foreach(f; _flags) if (flag == f) return true; return false;  }
//	void addFlag(string flag)  { if (!hasFlag(flag)) _flags ~= flag; }
//	void delFlag(string flag)  { if (hasFlag(flag)) {
//			string[] newFlags; foreach(f; _flags) if (flag != f) newFlags ~= f; _flags = newFlags;  
//		}}
//	void replaceFlag(string flag, string newFlag) { if (hasFlag(flag)) { delFlag(flag); addFlag(newFlag); }}
//
//	string flagsToHTML() { if (_flags) return " "~_flags.join(" "); return ""; }
//
//	//	string toText() { 
//	//		auto result = ""; 
//	//		foreach(obj; objects) result~= obj.toString;
//	//
//	//		return result;
//	//	}
//
//}
//
////unittest {
////	import std.stdio;
////	writeln("Testing uim.html...");
////}
////
////unittest { // Testing classes
////	import std.stdio;
////	auto h5 = new DH5Obj;
////
////	writeln("Testing DH5Obj.classes...");
////	assert(h5.classes == []);
////	assert(h5.classes.add("eins") == ["eins"]);
////	writeln(h5.classes);
////	writeln(h5.classes(["zwei", "drei"]));
////	assert(h5.classes(["zwei", "drei"]).classes == ["zwei", "drei"]);
////	writeln("xxx");
////	assert(h5.classes(["eins zwei", "drei"]).classes == ["eins", "zwei", "drei"]);
////
////	writeln("xxx");
////	assert(h5.classes.hasAll(["zwei", "drei"]) == true);
////	assert(h5.classes.hasAll(["zwei", "fünf"]) == false);
////	assert(h5.classes.hasAny(["zwei", "vier"]) == true);
////	assert(h5.classes.hasAny(["fünf", "vier"]) == false);
////	assert(h5.classes.has("drei") == true);
////	assert(h5.classes.has("vier") == false);
////	assert(h5.classes.has("drei zwei") == true);
////	assert(h5.classes.has("vier zwei") == false);
////
////	writeln("yyy");
////	assert(h5.classes.add(["zwei", "vier"]) == ["eins", "zwei", "drei", "vier"]);
////	assert(h5.classes.add("fünf") == ["eins", "zwei", "drei", "vier", "fünf"]);
////	assert(h5.classes.add("sechs sieben") == ["eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben"]);
////
////	assert(h5.classes.remove(["zwei", "drei"]) == ["eins", "vier", "fünf", "sechs", "sieben"]);
////	assert(h5.classes.remove("eins") == ["vier", "fünf", "sechs", "sieben"]);
////	assert(h5.classes.remove("eins sieben") == ["vier", "fünf", "sechs"]);
////
////	assert(h5.classes.toggle(["zwei", "vier"]) == ["fünf", "sechs", "zwei"]);
////	assert(h5.classes.toggle("zwei") == ["fünf", "sechs"]);
////	assert(h5.classes.toggle("drei") == ["fünf", "sechs", "drei"]);
////	assert(h5.classes.toggle("drei sieben") == ["fünf", "sechs", "sieben"]);
////	writeln(h5.classes.toggle("drei"), "/", h5.classes);
////}
////
////unittest { // Testing attributes
////	import std.stdio;
////	writeln("Testing DH5Obj.attributes...");
////
////	auto h5 = new DH5Obj;
////	writeln(h5);
////	writeln(h5.attributes);
////
////	assert(h5.attributes(["1":"2", "3":"4"]).attributes == ["1":"2", "3":"4"]);
////	assert(h5.attributes(["5":"6", "7":"("]).attributes == ["5":"6", "7":"("]);
////	assert(h5.attribute("2","1").attributes == ["5":"6", "7":"(", "2":"1"]);
////
////	assert(h5.attributes.add(["9":"6", "8":"("]) == ["5":"6", "7":"(", "2":"1", "9":"6", "8":"("]);
////	assert(h5.attributes.add(["9":"6", "8":"("]) == ["5":"6", "7":"(", "2":"1", "9":"6", "8":"("]);
//////	assert(h5.addAttribute("10","6") == ["5":"6", "7":"(", "2":"1", "9":"6", "8":"(", "10":"6"]);
//////	assert(h5.addAttribute("10","6") == ["5":"6", "7":"(", "2":"1", "9":"6", "8":"(", "10":"6"]);
////
////
////	assert(h5.attributes.remove(["9", "8"]) == ["5":"6", "7":"(", "2":"1", "10":"6"]);
////	assert(h5.attributes.remove(["9", "8"]) == ["5":"6", "7":"(", "2":"1", "10":"6"]);
////	assert(h5.attributes.remove("2") == ["5":"6", "7":"(", "10":"6"]);
////	assert(h5.attributes.remove("2") == ["5":"6", "7":"(", "10":"6"]);
////
////	assert(h5.attributes.hasAny(["5", "100"]));
////	assert(!h5.attributes.hasAny(["500", "100"]));
////	assert(h5.attributes.hasAll(["5", "7"]));
////	assert(!h5.attributes.hasAll(["5", "100"]));
////	assert(h5.attributes.has("5"));
////	assert(!h5.attributes.has("100"));
////	
////	assert(h5.attributes.hasValue("6"));
////	assert(!h5.attributes.hasValue("600"));
////
////	writeln(h5.attributes);
////}
////

unittest {
	
}