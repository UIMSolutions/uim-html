module uim.html;

public import core.vararg;
public import std.stdio;
public import std.string;
public import std.conv;
public import std.array;
public import std.traits;

public import uim.html.mixins;
public import uim.html.obj;
public import uim.html.templ;

public import uim.core;
public import uim.oop;
public import uim.web;
//public import uim.css;
//public import uim.js;

public import uim.html.core;
public import uim.html.elements;
public import uim.html.elements.inputs;
public import uim.html.extras;

string h5Doctype = "<!doctype html>";

//template ThisH5() {
//	const char[] ThisH5 = "	
//    this() { super(); }
//	this(T...)(T values) { this(); Add(values); }
//
//	void Add(T...)(T values) { foreach(v; values) Add(v); }
//	void Add(T:T[])(T values) { foreach(v; values) Add(v); }
//	void Add(T)(T value) { 
//		add(value); 
//	}
//	alias add = super.add;
//	alias set = super.set;
//	alias put = super.put;
//";
//	}
//template ThisH5(string tag) {
//			const char[] ThisH5 = "	
// 	this() { super(\""~tag~"\"); }
//	this(T...)(T values) { this(); Add(values); }
//	alias add = super.add;
//	alias set = super.set;
//	alias put = super.put;
//
//	void Add(T...)(T values) { foreach(v; values) Add(v); }
//	void Add(T:T[])(T values) { foreach(v; values) Add(v); }
//	void Add(T)(T value) { 
//		add(value); 
//	}
//	alias add = super.add;
//	alias set = super.set;
//	alias put = super.put;
//";
//		}
//		else {
//			const char[] ThisH5 = "	
// 	this() { super(); registerMembers; }
//	this(T...)(T values) { this(); Add(values);  }
//	alias add = super.add;
//	alias set = super.set;
//	alias put = super.put;
//	
//void Add(T...)(T values) { foreach(v; values) Add(v); }
//	void Add(T:T[])(T values) { foreach(v; values) Add(v); }
//	void Add(T)(T value) { 
//		// writeln(typeid(T));
//		add(value); 
//	}
//	alias add = super.add;
//	alias set = super.set;
//	alias put = super.put;
//";
//		}
//	}

enum FormMethod : string { get = "get", put = "put" } 
enum FormTarget	: string { blank = "_blank", self = "_self", parent = "_parent", top = "_top" }
enum InputType : string { button = "button", checkbox = "checkbox", color = "color", date = "date", 
	datetime = "datetime", datetimeLocal = "datetime-local", email = "email", file = "file",  
	hidde = "hidden", image = "image", month = "month", number = "number", password = "password",
	radio = "radio", range = "range", reset = "reset", search = "search", submit = "submit",
	tel = "tel", text = "text", time = "time", url = "url", week = "week" }


template H5ShortCut(string name) {
	const char[] H5ShortCut = "
     auto "~name~"() {
	  auto element = new DH5"~name~"();
      add(element);
	  return element;
    }
     auto "~name~"(T...)(T values) {
	  auto element = new DH5"~name~"(values);
      add(element);
	  return element;
    }";
}

// multi item methods
//void put(DObject[] elements, string attributeName, string value) { foreach(element; elements) element.put(attributeName, value); }
//void set(DObject[] elements, string attributeName, string value) { foreach(element; elements) element.set(attributeName, value); }

template TypeField(string type, string name, string Name, string defaultValue = "") {
	const char[] TypeField = "
	protected "~type~" _"~name~(defaultValue != "" ? " = "~defaultValue : "")~";
	 @property "~type~" "~name~"() { return _"~name~"; }
	 @property O "~name~"(this O)("~type~" value) { _"~name~" = value; return cast(O)this; }
	"; 
}
template BoolField(string name, string Name, string defaultValue = "false") {
	const char[] BoolField = "
	protected bool _"~name~" = "~defaultValue~";
	 @property bool "~name~"() { return _"~name~"; }
	 @property O "~name~"(this O)(bool value) { _"~name~" = value; return cast(O)this; }
	 O toggle"~Name~"(this O)() { _"~name~" = !_"~name~"; return cast(O)this; }
	 O toggle"~Name~"(this O)(bool value) { _"~name~" = !value; return cast(O)this; }
	"; 
}
template FlagValue(string name, string flag) {
	const char[] FlagValue = "
	 auto "~name~"(bool available = true) { if (available) addFlag(\""~flag~"\"); else delFlag(\""~flag~"\"); return this; }
	 auto "~flag~"(bool available = true) { return "~name~"(available); }";
}
template EnumField(string EnumType, string name, string defaultValue = "") {
	const char[] EnumField = "
	protected "~EnumType~" _"~name~(defaultValue == "" ? ";" : " = "~defaultValue~";")~"
	@property "~EnumType~" "~name~"() { return _"~name~"; }
	@property auto "~name~"("~EnumType~" value) { _"~name~" = value; return this; }
	 void add("~EnumType~" value) { "~name~"(value); }
	 void put(string key, "~EnumType~" value) { attributes[key] = value.toString); }
	 void put("~EnumType~" value) { "~name~"(value); }
";
}
template EnumValue(string EnumType, string name, string target = "class", string defaultValue = "") {
	const char[] EnumValue = "
	@property auto "~name~"("~EnumType~" value) { put("~target~", "~name~"); return this; }
	 void put("~EnumType~" value) { "~name~"(value); }
	 void put(string key, "~EnumType~" value) { put(key, value.toString); }
	 void add("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
	 void add("~EnumType~" value) { "~name~"(value); }
	 void put("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
";
}
template EnumArray(string EnumType, string name) {
	const char[] EnumArray = "
	protected "~EnumType~"[] _"~name~";
	@property "~EnumType~"[] "~name~"() { return _"~name~"; }
	@property O "~name~"(this O)("~EnumType~"[] values) { foreach(v; values) "~name~"("~EnumType~" v); return cast(O)this; }
	@property O "~name~"(this O)("~EnumType~" value) { _"~name~" ~= value; return cast(O)this; }
	void add("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
	void add("~EnumType~"[] values) { "~name~"(values); }
	void add("~EnumType~" value) { "~name~"(value); }

	void put("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
	void put(string key, "~EnumType~" value) { put(key, value.toString); }
	void put("~EnumType~"[] values) { "~name~"(values); }
	void put("~EnumType~" value) { "~name~"(value); }
";
}
template EnumValues(string EnumType, string target = "class") {
	const char[] EnumValues = "
	void add("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
	void add("~EnumType~" value) { add(\""~target~"\", value); }
	void add(string key, "~EnumType~" value) { put(key, value.toString); }

	void set("~EnumType~"[string] values) { foreach(k, v; values) set(k, v); }
	void set("~EnumType~" value) { set(\""~target~"\", value); }
	void set(string key, "~EnumType~" value) { set(key, value.toString); }

	void put("~EnumType~"[string] values) { foreach(k, v; values) put(k, v); }
	void put("~EnumType~" value) { put(\""~target~"\", value); }
	void put(string key, "~EnumType~" value) { put(key, value.toString); }
";
}
template ObjValue(string className, string name, string Name = "") {
	const char[] ObjValue = "
	auto "~name~"(T...)(T values) { add(new "~className~"(values)); return this; }
"~(Name ? "
		auto "~Name~"(T...)(T values) { auto value = new "~className~"(values); add(value); return value; }
		": "");
}
template ObjField(string className, string name, string Name = "", string defaultValue = "") {
	const char[] ObjField = "
	protected "~className~" _"~name~(defaultValue != "" ? " = "~defaultValue : "")~";
	"~className~" "~name~"() { return _"~name~"; }
	auto "~name~"("~className~" value) { _"~name~" = value; return this; }
	auto "~name~"(T)(T values...) { if ("~name~") _"~name~"(values); return this; }
"~(Name ? "
	auto "~Name~"(T...)(T values) { auto value = new "~className~"(values); "~name~"(value); return value; }
		": "");
}
template ObjFieldChain(string name, string Name, string className, string defaultValue = "") {
	const char[] ObjFieldChain = "
	protected "~className~" _"~name~(defaultValue != "" ? " = "~defaultValue : "")~";
	"~className~" "~name~"() { return _"~name~"; }
	auto "~name~"("~className~" value) { _"~name~" = value; if (_"~name~") add(_"~name~"); return this; }
	auto "~name~"(T...)(T values) { if ("~name~") _"~name~"(values); return this; }
	auto "~Name~"("~className~" value) { _"~name~" = value; if (_"~name~") add(_"~name~"); return _"~name~"; }
	auto "~Name~"(T...)(T values) { if ("~name~") _"~name~"(values); return _"~name~"; }
";
}

auto HTML(string tag, bool single = false)() { return (single) ? "<"~tag~">" : "<"~tag~" />"; }
auto HTML(string tag, bool single = false)(string[] classes) { return (single) ? "<"~tag~" class=\""~classes.unique.join(" ")~"\">" : "<"~tag~" class=\""~classes.unique.join(" ")~"\" />"; }
auto HTML(string tag)(string content) { return "<"~tag~">"~content~"</"~tag~">"; }
auto HTML(string tag)(string[] classes, string content) { return "<"~tag~" class=\""~classes.unique.join(" ")~"\">"~content~"</"~tag~">"; }

unittest {
	writeln("Testing ", __MODULE__);

	assert(HTML!"div" == "<div />");
	assert(HTML!("input", true) == "<input>");
	assert(HTML!"div"(["aClass"]) == "<div class=\"aClass\" />");
	assert(HTML!"div"(["aClass", "aClass"]) == "<div class=\"aClass\" />");
	assert(HTML!"div"(["aClass", "bClass"]) == "<div class=\"aClass bClass\" />");
	assert(HTML!("input", true)(["aClass"]) == "<input class=\"aClass\">");
	assert(HTML!"div"("someContent") == "<div>someContent</div>");
	assert(HTML!"div"(["aClass"], "someContent") == "<div class=\"aClass\">someContent</div>");

	writeln("Test in uim.html...");
	
	writeln("H5DIV => \t", H5DIV);
	writeln("H5DIV(txt) => \t", H5DIV("txt"));
	writeln("H5DIV([cls]) => \t", H5DIV(["cls"]));
	writeln("H5DIV([cls, cas]) => \t", H5DIV(["cls", "cas"]));
	writeln("H5DIV([a:b]) => \t", H5DIV(["a":"b"]));
	writeln("H5DIV([a:b, c:d]) => \t", H5DIV(["a":"b", "c":"d"]));
	writeln("H5DIV(txt, [cls]) => \t", H5DIV("txt", ["cls"]));
	writeln("H5DIV(txt, [cls, cas]) => \t", H5DIV("txt", ["cls", "cas"]));
	writeln("H5DIV(txt, [a:b]) => \t", H5DIV("txt", ["a":"b"]));
	writeln("H5DIV(txt, [a:b, c:d]) => \t", H5DIV("txt", ["a":"b", "c":"d"]));
	writeln("H5DIV([cls, cas], [a:b]) => \t", H5DIV(["cls", "cas"], ["a":"b"]));
	writeln("H5DIV([cls, cas], [a:b, c:d]) => \t", H5DIV(["cls", "cas"], ["a":"b", "c":"d"]));
	writeln("H5DIV(txt, [cls, cas], [a:b]) => \t", H5DIV("txt", ["cls", "cas"], ["a":"b"]));
	writeln("H5DIV(txt, [cls, cas], [a:b, c:d]) => \t", H5DIV("txt", ["cls", "cas"], ["a":"b", "c":"d"]));
	//		writeln("H5DIV(H5DIV) => \t", H5DIV(H5DIV));
	//	writeln("H5DIV(H5DIV, H5DIV) => \t", H5DIV(
	//			CSSRule("#tt", ["background-color": "lightgreen"]),
	//			H5DIV, H5DIV));
	
	//	writeln("H5DIV([cls], txt) => \t", H5DIV(["cls"], "txt"));
	//	writeln("H5DIV([cls], txt, tex) => \t", H5DIV(["cls"], "txt", "tex"));
	//	writeln("H5DIV([cls], [a:b]) => \t", H5DIV(["cls"], ["a":"b"]));
	//	writeln("H5DIV([cls], [a:b, c:d]) => \t", H5DIV(["cls"], ["a":"b", "c":"d"]));
	//	writeln("H5DIV([cls, cas], txt) => \t", H5DIV(["cls", "cas"], "txt"));
	//	writeln("H5DIV([cls, cas], txt, tex) => \t", H5DIV(["cls", "cas"], "txt", "tex"));
	//	writeln("H5DIV([cls, cas], [a:b]) => \t", H5DIV(["cls", "cas"], ["a":"b"]));
	//	writeln("H5DIV([cls, cas], [a:b, c:d]) => \t", H5DIV(["cls", "cas"], ["a":"b", "c":"d"]));
	//	
	//	writeln("H5DIV([cls], txt,H5DIV, H5DIV) => \t", H5DIV(["cls"], "txt", H5DIV, H5DIV));
	//	writeln("H5DIV([cls], txt, tex,H5DIV, H5DIV) => \t", H5DIV(["cls"], "txt", "tex", H5DIV, H5DIV));
	//	writeln("H5DIV([cls], [a:b],H5DIV, H5DIV) => \t", H5DIV(["cls"], ["a":"b"], H5DIV, H5DIV));
	//	writeln("H5DIV([cls], [a:b, c:d],H5DIV, H5DIV) => \t", H5DIV(["cls"], ["a":"b", "c":"d"], H5DIV, H5DIV));
	//	writeln("H5DIV([cls, cas], txt,H5DIV, H5DIV) => \t", H5DIV(["cls", "cas"], "txt", H5DIV, H5DIV));
	//	writeln("H5DIV([cls, cas], txt, tex,H5DIV, H5DIV) => \t", H5DIV(["cls", "cas"], "txt", "tex", H5DIV, H5DIV));
	//	writeln("H5DIV([cls, cas], [a:b],H5DIV, H5DIV) => \t", H5DIV(["cls", "cas"], ["a":"b"], H5DIV, H5DIV));
	//	writeln("H5DIV([cls, cas], [a:b, c:d], H5DIV, H5DIV) => \t", H5DIV(["cls", "cas"], ["a":"b", "c":"d"], H5DIV, H5DIV));
}
