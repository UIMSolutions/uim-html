module uim.html.mixins;

import uim.html;

template H5This(string tag, string classes = null, string attributes = null, bool single = false) {
	const char[] strTag = `this.tag("`~tag.toLower~`");`;
	const char[] strSingle = (single) ? "this.single(true);" : "";
	const char[] strClasses = (classes) ? "_classes.add("~classes~");" : "";
	const char[] strAttributes = (attributes) ? "_attributes.add("~attributes~");" : "";

	const char[] H5This = `
	this(string someContent) { super(someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(DH5Obj[] someContent...) { super(someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(DH5 someContent) { super(someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string id, string someContent) { super(id, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, DH5Obj[] someContent...) { super(id, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, DH5 someContent) { super(id, someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string id, string[] someClasses) { super(id, someClasses); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, string someContent) { super(id, someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, DH5Obj[] someContent...) { super(id, someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, DH5 someContent) { super(id, someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string id, string[string] someAttributes)  { super(id, someAttributes); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[string] someAttributes, string someContent)  { super(id, someAttributes).content(someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[string] someAttributes, DH5Obj[] someContent...) { super(id, someAttributes).content(someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[string] someAttributes, DH5 someContent) { super(id, someAttributes).content(someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string id, string[] someClasses, string[string] someAttributes)  { super(id, someClasses, someAttributes); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, string[string] someAttributes, string someContent)  { super(id, someClasses, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, string[string] someAttributes, DH5Obj[] someContent...) { super(id, someClasses, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string id, string[] someClasses, string[string] someAttributes, DH5 someContent) { super(id, someClasses, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string[] someClasses) { this.classes(someClasses); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] someClasses, string someContent) { super(someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] someClasses, DH5Obj[] someContent...) { super(someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] someClasses, DH5 someContent) { super(someClasses, someContent); `~strTag~strSingle~strClasses~strAttributes~`}

 	this(string[string] someAttributes) { _attributes(someAttributes); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[string] someAttributes, string someContent) { super(someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[string] someAttributes, DH5Obj[] someContent...) { super(someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[string] someAttributes, DH5 someContent) { super(someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}

	this(string[] classes, string[string] someAttributes) { super(classes, someAttributes); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] classes, string[string] someAttributes, string someContent) { super(classes, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] classes, string[string] someAttributes, DH5Obj[] someContent...) { super(classes, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	this(string[] classes, string[string] someAttributes, DH5 someContent) { super(classes, someAttributes, someContent); `~strTag~strSingle~strClasses~strAttributes~`}
	`;
}

unittest {
	
}
//	O Add(this O, T...)(T values) { 
//		switch (values.length) {
//			case 0: break; 
//			case 1: add(values[0]); break;
//			default: 
//				static if ((is(typeof(values[0]) == string)) && ((is(typeof(values[1]) == string[])) || (is(typeof(values[1]) == string[string])))) { 
//					_id = values[0]; foreach(v; values[1..$]) add(v); }
//				else { foreach(v; values) add(v); }
//				break;
//		}
//		return cast(O)this;
//	};
//	alias add = super.add;  		

template FuncH5(string name) {		
	const char[] FuncH5 = "
auto H5"~name~"(string content) { return new DH5"~name~"(content); }
auto H5"~name~"(DH5Obj[] content...) { return new DH5"~name~"(content); }
auto H5"~name~"(DH5 content) { return new DH5"~name~"(content); }

auto H5"~name~"(string id, string content) { return new DH5"~name~"(id, content); }
auto H5"~name~"(string id, DH5Obj[] content...) { return new DH5"~name~"(id, content); }
auto H5"~name~"(string id, DH5 content) { return new DH5"~name~"(id, content); }

auto H5"~name~"(string id, string[] classes) { return new DH5"~name~"(id, classes); }
auto H5"~name~"(string id, string[] classes, string content) { return new DH5"~name~"(id, classes, content); }
auto H5"~name~"(string id, string[] classes, DH5Obj[] content...) { return new DH5"~name~"(id, classes, content); }
auto H5"~name~"(string id, string[] classes, DH5 content) { return new DH5"~name~"(id, classes, content); }

auto H5"~name~"(string id, string[string] attributes) { return new DH5"~name~"(id, attributes); }
auto H5"~name~"(string id, string[string] attributes, string content) { return new DH5"~name~"(id, attributes, content); }
auto H5"~name~"(string id, string[string] attributes, DH5Obj[] content...) { return new DH5"~name~"(id, attributes, content); }
auto H5"~name~"(string id, string[string] attributes, DH5 content) { return new DH5"~name~"(id, attributes, content); }

auto H5"~name~"(string id, string[] classes, string[string] attributes) { return new DH5"~name~"(id, classes, attributes); }
auto H5"~name~"(string id, string[] classes, string[string] attributes, string content) { return new DH5"~name~"(id, classes, attributes, content); }
auto H5"~name~"(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { return new DH5"~name~"(id, classes, attributes, content); }
auto H5"~name~"(string id, string[] classes, string[string] attributes, DH5 content) { return new DH5"~name~"(id, classes, attributes, content); }

auto H5"~name~"(string[] classes) { return new DH5"~name~"(classes); }
auto H5"~name~"(string[] classes, string content) { return new DH5"~name~"(classes, content); }
auto H5"~name~"(string[] classes, DH5Obj[] content...) { return new DH5"~name~"(classes, content); }
auto H5"~name~"(string[] classes, DH5 content) { return new DH5"~name~"(classes, content); }

auto H5"~name~"(string[string] attributes) { return new DH5"~name~"(attributes); }
auto H5"~name~"(string[string] attributes, string content) { return new DH5"~name~"(attributes, content); }
auto H5"~name~"(string[string] attributes, DH5Obj[] content...) { return new DH5"~name~"(attributes, content); }
auto H5"~name~"(string[string] attributes, DH5 content) { return new DH5"~name~"(attributes, content); }

auto H5"~name~"(string[] classes, string[string] attributes) { return new DH5"~name~"(classes, attributes); }
auto H5"~name~"(string[] classes, string[string] attributes, string content) { return new DH5"~name~"(classes, attributes, content); }
auto H5"~name~"(string[] classes, string[string] attributes, DH5Obj[] content...) { return new DH5"~name~"(classes, attributes, content); }
auto H5"~name~"(string[] classes, string[string] attributes, DH5 content) { return new DH5"~name~"(classes, attributes, content); }
 ";
}


template H5Short(string name) {		
	const char[] H5Short = "
auto "~name~"(string content) { return new D"~name~"(content); }
auto "~name~"(DH5Obj[] content...) { return new D"~name~"(content); }
auto "~name~"(DH5 content) { return new D"~name~"(content); }

auto "~name~"(string id, string[] classes) { return new D"~name~"(id, classes); }
auto "~name~"(string id, string[] classes, string content) { return new D"~name~"(id, classes, content); }
auto "~name~"(string id, string[] classes, DH5Obj[] content...) { return new D"~name~"(id, classes, content); }
auto "~name~"(string id, string[] classes, DH5 content) { return new D"~name~"(id, classes, content); }

auto "~name~"(string id, string[string] attributes) { return new D"~name~"(id, attributes); }
auto "~name~"(string id, string[string] attributes, string content) { return new D"~name~"(id, attributes, content); }
auto "~name~"(string id, string[string] attributes, DH5Obj[] content...) { return new D"~name~"(id, attributes, content); }
auto "~name~"(string id, string[string] attributes, DH5 content) { return new D"~name~"(id, attributes, content); }

auto "~name~"(string id, string[] classes, string[string] attributes) { return new D"~name~"(id, classes, attributes); }
auto "~name~"(string id, string[] classes, string[string] attributes, string content) { return new D"~name~"(id, classes, attributes, content); }
auto "~name~"(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { return new D"~name~"(id, classes, attributes, content); }
auto "~name~"(string id, string[] classes, string[string] attributes, DH5 content) { return new D"~name~"(id, classes, attributes, content); }

auto "~name~"(string[] classes) { return new D"~name~"(classes); }
auto "~name~"(string[] classes, string content) { return new D"~name~"(classes, content); }
auto "~name~"(string[] classes, DH5Obj[] content...) { return new D"~name~"(classes, content); }
auto "~name~"(string[] classes, DH5 content) { return new D"~name~"(classes, content); }

auto "~name~"(string[string] attributes) { return new D"~name~"(attributes); }
auto "~name~"(string[string] attributes, string content) { return new D"~name~"(attributes, content); }
auto "~name~"(string[string] attributes, DH5Obj[] content...) { return new D"~name~"(attributes, content); }
auto "~name~"(string[string] attributes, DH5 content) { return new D"~name~"(attributes, content); }

auto "~name~"(string[] classes, string[string] attributes) { return new D"~name~"(classes, attributes); }
auto "~name~"(string[] classes, string[string] attributes, string content) { return new D"~name~"(classes, attributes, content); }
auto "~name~"(string[] classes, string[string] attributes, DH5Obj[] content...) { return new D"~name~"(classes, attributes, content); }
auto "~name~"(string[] classes, string[string] attributes, DH5 content) { return new D"~name~"(classes, attributes, content); }
 ";
}

template MyClassAttribute(string name, string clname = null) {
	const char[] cl = (clname) ? clname : name;
	const char[] MyClassAttribute = "
@property O "~name~"(this O)(bool value = true) { if (value) _classes.add(\""~cl~"\"); else _classes.remove(\""~cl~"\"); return cast(O)this; }
";
}

template MyAttribute(string name, string h5name = null) {
	const char[] h5 = (h5name) ? h5name : name;
	const char[] MyAttribute = "
@property string "~name~"() { return _attributes[\""~h5~"\"]; }
@property O "~name~"(this O)(string value) { if (value.length > 0) _attributes[\""~h5~"\"] = value; return cast(O)this; }
@property O "~name~"(this O)(bool value) { if (value) _attributes[\""~h5~"\"] = \"true\"; return cast(O)this; }
@property O "~name~"(this O)(int value) { if (value) _attributes[\""~h5~"\"] = to!string(value); return cast(O)this; }
@property O "~name~"(this O)(double value) { if (value) _attributes[\""~h5~"\"] = to!string(value); return cast(O)this; }
";
}

template MyContent(string name, string className) {		
	const char[] MyContent = "
O "~name~"(this O)() { this.content("~className~"()); return cast(O)this; }

O "~name~"(this O)(string content) { this.content("~className~"(content)); return cast(O)this; }
O "~name~"(this O)(DH5Obj[] content...) { this.content("~className~"(content)); return cast(O)this; }
O "~name~"(this O)(DH5 content) { this.content("~className~"(content)); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes) { this.content("~className~"(id, classes)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string content) { this.content("~className~"(id, classes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, DH5Obj[] content...) { this.content("~className~"(id, classes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, DH5 content) { this.content("~className~"(id, classes, content)); return cast(O)this; }

O "~name~"(this O)(string id, string[string] attributes) { this.content("~className~"(id, attributes)); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, string content) { this.content("~className~"(id, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { this.content("~className~"(id, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, DH5 content) { this.content("~className~"(id, attributes, content)); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes, string[string] attributes) { this.content("~className~"(id, classes, attributes)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, string content) { this.content("~className~"(id, classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { this.content("~className~"(id, classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, DH5 content) { this.content("~className~"(id, classes, attributes, content)); return cast(O)this; }

O "~name~"(this O)(string[] classes) { this.content("~className~"(classes)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string content) { this.content("~className~"(classes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, DH5Obj[] content...) { this.content("~className~"(classes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, DH5 content) { this.content("~className~"(classes, content)); return cast(O)this; }

O "~name~"(this O)(string[string] attributes) { this.content("~className~"(attributes)); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, string content) { this.content("~className~"(attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, DH5Obj[] content...) { this.content("~className~"(attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, DH5 content) { this.content("~className~"(attributes, content)); return cast(O)this; }

O "~name~"(this O)(string[] classes, string[string] attributes) { this.content("~className~"(classes, attributes)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, string content) { this.content("~className~"(classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, DH5Obj[] content...) { this.content("~className~"(classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, DH5 content) { this.content("~className~"(classes, attributes, content)); return cast(O)this; }

O "~name~"(this O)(D"~className~" content) { this.content(content); return cast(O)this; }
 ";
}

template MyH5Content(string className, string name) {		
	const char[] MyH5Content = "
O "~name~"(this O)("~className~" obj) { this.content(obj); return cast(O)this; }

O "~name~"(this O)() { this.content(new "~className~"(``)); return cast(O)this; }
O "~name~"(this O)(string id) { this.content(new "~className~"(id)); return cast(O)this; }
O "~name~"(this O)(string id, string content) { this.content(new "~className~"(id, content)); return cast(O)this; }
O "~name~"(this O)(string id, DH5Obj[] content...) { this.content(new "~className~"(id, content)); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes) { this.content(new "~className~"(id, classes)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string content) { this.content(new "~className~"(id, classes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, DH5Obj[] content...) { this.content(new "~className~"(id, classes, content)); return cast(O)this; }

O "~name~"(this O)(string id, string[string] attributes) { this.content(new "~className~"(id, attributes)); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, string content) { this.content(new "~className~"(id, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { this.content(new "~className~"(id, attributes, content)); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes, string[string] attributes) { this.content(new "~className~"(id, classes, attributes)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, string content) { this.content(new "~className~"(id, classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { this.content(new "~className~"(id, classes, attributes, content)); return cast(O)this; }

O "~name~"(this O)(string[] classes) { this.content(new "~className~"(classes)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string content) { this.content(new "~className~"(classes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, DH5Obj[] content...) { this.content(new "~className~"(classes, content)); return cast(O)this; }

O "~name~"(this O)(string[string] attributes) { this.content(new "~className~"(attributes)); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, string content) { this.content(new "~className~"(attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, DH5Obj[] content...) { this.content(new "~className~"(attributes, content)); return cast(O)this; }

O "~name~"(this O)(string[] classes, string[string] attributes) { this.content(new "~className~"(classes, attributes)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, string content) { this.content(new "~className~"(classes, attributes, content)); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, DH5Obj[] content...) { this.content(new "~className~"(classes, attributes, content)); return cast(O)this; }
 ";
}

template MyH5Obj(string className, string name) {		
	const char[] MyH5Obj = "
"~className~" _"~name~";
"~className~" "~name~"() { return _"~name~"; }

O "~name~"(this O)("~className~" obj) { _"~name~" = obj; return cast(O)this; }

O "~name~"(this O)(string id) { _"~name~" = new "~className~"(id); return cast(O)this; }
O "~name~"(this O)(string id, string content) { _"~name~" = new "~className~"(id, content); return cast(O)this; }
O "~name~"(this O)(string id, DH5Obj[] content...) { _"~name~" = new "~className~"(id, content); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes) { _"~name~" = new "~className~"(id, classes); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string content) { _"~name~" = new "~className~"(id, classes, content); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, DH5Obj[] content...) { _"~name~" = new "~className~"(id, classes, content); return cast(O)this; }

O "~name~"(this O)(string id, string[string] attributes) { _"~name~" = new "~className~"(id, attributes); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, string content) { _"~name~" = new "~className~"(id, attributes, content); return cast(O)this; }
O "~name~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { _"~name~" = new "~className~"(id, attributes, content); return cast(O)this; }

O "~name~"(this O)(string id, string[] classes, string[string] attributes) { _"~name~" = new "~className~"(id, classes, attributes); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, string content) { _"~name~" = new "~className~"(id, classes, attributes, content); return cast(O)this; }
O "~name~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _"~name~" = new "~className~"(id, classes, attributes, content); return cast(O)this; }

O "~name~"(this O)(string[] classes) { _"~name~" = new "~className~"(classes); return cast(O)this; }
O "~name~"(this O)(string[] classes, string content) { _"~name~" = new "~className~"(classes, content); return cast(O)this; }
O "~name~"(this O)(string[] classes, DH5Obj[] content...) { _"~name~" = new "~className~"(classes, content); return cast(O)this; }

O "~name~"(this O)(string[string] attributes) { _"~name~" = new "~className~"(attributes); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, string content) { _"~name~" = new "~className~"(attributes, content); return cast(O)this; }
O "~name~"(this O)(string[string] attributes, DH5Obj[] content...) { _"~name~" = new "~className~"(attributes, content); return cast(O)this; }

O "~name~"(this O)(string[] classes, string[string] attributes) { _"~name~" = new "~className~"(classes, attributes); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, string content) { _"~name~" = new "~className~"(classes, attributes, content); return cast(O)this; }
O "~name~"(this O)(string[] classes, string[string] attributes, DH5Obj[] content...) { _"~name~" = new "~className~"(classes, attributes, content); return cast(O)this; }
 ";
}
