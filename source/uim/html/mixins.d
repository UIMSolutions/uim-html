module uim.html.mixins;

import uim.html;

auto h5Methods(const char[] left, const char[] right) {
	return "
"~left~"(string content) { return "~right~"(content); }
"~left~"(DH5Obj[] content...) { return "~right~"(content); }
"~left~"(DH5 content) { return "~right~"(content); }

"~left~"(string id, string content) { return "~right~"(id, content); }
"~left~"(string id, DH5Obj[] content...) { return "~right~"(id, content); }
"~left~"(string id, DH5 content) { return "~right~"(id, content); }

"~left~"(string id, string[] classes) { return "~right~"(id, classes); }
"~left~"(string id, string[] classes, string content) { return "~right~"(id, classes, content); }
"~left~"(string id, string[] classes, DH5Obj[] content...) { return "~right~"(id, classes, content); }
"~left~"(string id, string[] classes, DH5 content) { return "~right~"(id, classes, content); }

"~left~"(string id, string[string] attributes) { return "~right~"(id, attributes); }
"~left~"(string id, string[string] attributes, string content) { return "~right~"(id, attributes, content); }
"~left~"(string id, string[string] attributes, DH5Obj[] content...) { return "~right~"(id, attributes, content); }
"~left~"(string id, string[string] attributes, DH5 content) { return "~right~"(id, attributes, content); }

"~left~"(string id, string[] classes, string[string] attributes) { return "~right~"(id, classes, attributes); }
"~left~"(string id, string[] classes, string[string] attributes, string content) { return "~right~"(id, classes, attributes, content); }
"~left~"(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { return "~right~"(id, classes, attributes, content); }
"~left~"(string id, string[] classes, string[string] attributes, DH5 content) { return "~right~"(id, classes, attributes, content); }

"~left~"(string[] classes) { return "~right~"(classes); }
"~left~"(string[] classes, string content) { return "~right~"(classes, content); }
"~left~"(string[] classes, DH5Obj[] content...) { return "~right~"(classes, content); }
"~left~"(string[] classes, DH5 content) { return "~right~"(classes, content); }

"~left~"(string[string] attributes) { return "~right~"(attributes); }
"~left~"(string[string] attributes, string content) { return "~right~"(attributes, content); }
"~left~"(string[string] attributes, DH5Obj[] content...) { return "~right~"(attributes, content); }
"~left~"(string[string] attributes, DH5 content) { return "~right~"(attributes, content); }

"~left~"(string[] classes, string[string] attributes) { return "~right~"(classes, attributes); }
"~left~"(string[] classes, string[string] attributes, string content) { return "~right~"(classes, attributes, content); }
"~left~"(string[] classes, string[string] attributes, DH5Obj[] content...) { return "~right~"(classes, attributes, content); }
"~left~"(string[] classes, string[string] attributes, DH5 content) { return "~right~"(classes, attributes, content); }";
}

template H5This(string tag, string classes = null, string attributes = null, bool single = false) {
	const char[] strTag = `this.tag("`~tag.toLower~`");`;
	const char[] strSingle = (single) ? "this.single(true);" : "";
	const char[] strClasses = (classes) ? "this.classes("~classes~");" : "";
	const char[] strAttributes = (attributes) ? "this.attributes("~attributes~");" : "";
	const char[] initial = strTag~strSingle~strClasses~strAttributes;

	const char[] H5This = `
	this(string someContent) { super(); `~initial~`this.content(someContent); }
	this(DH5Obj[] someContent...) { super(); `~initial~`this.content(someContent); }
	this(DH5 someContent) { super(); `~initial~`this.content(someContent); }

	this(string id, string someContent) { super(); `~initial~`this.id(id).content(someContent); }
	this(string id, DH5Obj[] someContent...) { super(); `~initial~`this.id(id).content(someContent); }
	this(string id, DH5 someContent) { super(); `~initial~`this.id(id).content(someContent); }

	this(string id, string[] someClasses) { super(); `~initial~`this.id(id).classes(someClasses); }
	this(string id, string[] someClasses, string someContent) { super(); `~initial~`this.id(id).classes(someClasses).content(someContent); }
	this(string id, string[] someClasses, DH5Obj[] someContent...) { super(); `~initial~`this.id(id).classes(someClasses).content(someContent); }
	this(string id, string[] someClasses, DH5 someContent) { super(); `~initial~`this.id(id).classes(someClasses).content(someContent); }

	this(string id, string[string] someAttributes)  { super(); `~initial~`this.id(id).attributes(someAttributes); }
	this(string id, string[string] someAttributes, string someContent)  { super(); `~initial~`this.id(id).attributes(someAttributes).content(someContent); }
	this(string id, string[string] someAttributes, DH5Obj[] someContent...) { super(); `~initial~`this.id(id).attributes(someAttributes).content(someContent); }
	this(string id, string[string] someAttributes, DH5 someContent) { super(); `~initial~`this.id(id).attributes(someAttributes).content(someContent); }

	this(string id, string[] someClasses, string[string] someAttributes)  { super(); `~initial~`this.id(id).classes(someClasses).attributes(someAttributes); }
	this(string id, string[] someClasses, string[string] someAttributes, string someContent)  { super(); `~initial~`this.id(id).classes(someClasses).attributes(someAttributes).content(someContent); }
	this(string id, string[] someClasses, string[string] someAttributes, DH5Obj[] someContent...) { super(); `~initial~`this.id(id).classes(someClasses).attributes(someAttributes).content(someContent); }
	this(string id, string[] someClasses, string[string] someAttributes, DH5 someContent) { super(); `~initial~`this.id(id).classes(someClasses).attributes(someAttributes).content(someContent); }

	this(string[] someClasses) { super(); `~initial~`this.classes(someClasses); }
	this(string[] someClasses, string someContent) { super(); `~initial~`this.classes(someClasses).content(someContent); }
	this(string[] someClasses, DH5Obj[] someContent...) { super(); `~initial~`this.classes(someClasses).content(someContent); }
	this(string[] someClasses, DH5 someContent) { super(); `~initial~`this.classes(someClasses).content(someContent); }

 	this(string[string] someAttributes) { super();`~initial~`this.attributes(someAttributes); }
	this(string[string] someAttributes, string someContent) { super(); `~initial~`this.attributes(someAttributes).content(someContent); }
	this(string[string] someAttributes, DH5Obj[] someContent...) { super(); `~initial~`this.attributes(someAttributes).content(someContent); }
	this(string[string] someAttributes, DH5 someContent) { super(); `~initial~`this.attributes(someAttributes).content(someContent); }

	this(string[] someClasses, string[string] someAttributes) { super(); `~initial~`this.classes(someClasses).attributes(someAttributes); }
	this(string[] someClasses, string[string] someAttributes, string someContent) { super(); `~initial~`this.classes(someClasses).attributes(someAttributes).content(someContent); }
	this(string[] someClasses, string[string] someAttributes, DH5Obj[] someContent...) { super(); `~initial~`this.classes(someClasses).attributes(someAttributes).content(someContent); }
	this(string[] someClasses, string[string] someAttributes, DH5 someContent) { super(); `~initial~`this.classes(someClasses).attributes(someAttributes).content(someContent); }
	`;
}

unittest {
}

template H5Short(string name) {		
	const char[] H5Short = h5Methods("auto H5"~name, "new DH5"~name);
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

auto h5Content(const char[] left, const char[] right) {
	return "
"~left~"(this O)() { this.content("~right~"()); return cast(O)this; }

"~left~"(this O)(string content) { this.content("~right~"(content)); return cast(O)this; }
"~left~"(this O)(string id, string content) { this.content("~right~"(id, content)); return cast(O)this; }
"~left~"(this O)(DH5Obj[] content...) { this.content("~right~"(content)); return cast(O)this; }
"~left~"(this O)(DH5 content) { this.content("~right~"(content)); return cast(O)this; }

"~left~"(this O)(string id, string[] classes) { this.content("~right~"(id, classes)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, string content) { this.content("~right~"(id, classes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, DH5Obj[] content...) { this.content("~right~"(id, classes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, DH5 content) { this.content("~right~"(id, classes, content)); return cast(O)this; }

"~left~"(this O)(string id, string[string] attributes) { this.content("~right~"(id, attributes)); return cast(O)this; }
"~left~"(this O)(string id, string[string] attributes, string content) { this.content("~right~"(id, attributes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { this.content("~right~"(id, attributes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[string] attributes, DH5 content) { this.content("~right~"(id, attributes, content)); return cast(O)this; }

"~left~"(this O)(string id, string[] classes, string[string] attributes) { this.content("~right~"(id, classes, attributes)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, string[string] attributes, string content) { this.content("~right~"(id, classes, attributes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { this.content("~right~"(id, classes, attributes, content)); return cast(O)this; }
"~left~"(this O)(string id, string[] classes, string[string] attributes, DH5 content) { this.content("~right~"(id, classes, attributes, content)); return cast(O)this; }

"~left~"(this O)(string[] classes) { this.content("~right~"(classes)); return cast(O)this; }
"~left~"(this O)(string[] classes, string content) { this.content("~right~"(classes, content)); return cast(O)this; }
"~left~"(this O)(string[] classes, DH5Obj[] content...) { this.content("~right~"(classes, content)); return cast(O)this; }
"~left~"(this O)(string[] classes, DH5 content) { this.content("~right~"(classes, content)); return cast(O)this; }

"~left~"(this O)(string[string] attributes) { this.content("~right~"(attributes)); return cast(O)this; }
"~left~"(this O)(string[string] attributes, string content) { this.content("~right~"(attributes, content)); return cast(O)this; }
"~left~"(this O)(string[string] attributes, DH5Obj[] content...) { this.content("~right~"(attributes, content)); return cast(O)this; }
"~left~"(this O)(string[string] attributes, DH5 content) { this.content("~right~"(attributes, content)); return cast(O)this; }

"~left~"(this O)(string[] classes, string[string] attributes) { this.content("~right~"(classes, attributes)); return cast(O)this; }
"~left~"(this O)(string[] classes, string[string] attributes, string content) { this.content("~right~"(classes, attributes, content)); return cast(O)this; }
"~left~"(this O)(string[] classes, string[string] attributes, DH5Obj[] content...) { this.content("~right~"(classes, attributes, content)); return cast(O)this; }
"~left~"(this O)(string[] classes, string[string] attributes, DH5 content) { this.content("~right~"(classes, attributes, content)); return cast(O)this; }
 ";
}

template MyContent(string name, string className) {		
	const char[] MyContent = h5Content("O "~name, className); 
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
