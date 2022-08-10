﻿module uim.html.elements.head;

@safe:
import uim.html;

class DH5Head : DH5Obj {
protected:
	string _title;
public:
	mixin(H5This!("head"));

	 DH5Head Meta(STRINGAA values) { this.add(H5Meta(values)); return this; }
	DH5Head Base(STRINGAA values) { this.add(H5Base(values)); return this; }
	 DH5Head Link(STRINGAA values) { this.add(H5Link(values)); return this; }
	 DH5Head Link(string href, string media = "") { 
		if (media) return Link(["rel":"stylesheet", "href": href, "type":"text/css", "media":media]);
		else return Link(["rel":"stylesheet", "href": href, "type":"text/css"]);
	}
	 DH5Head Title(string content = null) { this.add(H5Title(content)); return this; }

	 O scripts(this O)(string[] links) { foreach(l; links) add(H5Script(["src":l])); return cast(O)this; }
	 O script(this O, T...)(T values) { add(H5Script(values)); return cast(O)this; }
}
mixin(H5Short!"Head");

unittest {	
	assert(H5Head, "<head></head>"));
}
