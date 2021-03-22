module uim.html.elements.html;

import uim.html;

/**
 * DH5Html - Wrapper for the html-Element
 * Das html-Element, auch root(-Element) oder Wurzelelement enthält den vollständigen Inhalt einer Internetseite. 
 * Date: January 09, 2015
 */
@safe class DH5Html : DH5Obj {
	mixin(H5This!"html");

	override public void _init() {
		super._init;
		_head = H5Head;
		_body_ = H5Body;
	}

	 void Add(T...)(T values) { _body.Add(values); }

	 O Add(this O, T...)(T values) { 
		switch (values.length) {
			case 0: break; 
			case 1: 
				static if (is(typeof(values[0]) == DH5Head)) _head = values[0];
				else if (is(typeof(values[0]) == DH5Body)) _body = values[0];
				else _body.add(values[0]); break;
			default: 
				static if ((is(typeof(values[0]) == string)) && ((is(typeof(values[1]) == string[])) || (is(typeof(values[1]) == string[string])))) { 
					_id = values[0]; foreach(v; values[1..$]) {
						static if (is(typeof(v) == DH5Head)) { _head = v; continue; }
						static if (is(typeof(v) == DH5Body)) { _body = v; continue; }
						_body.add(v); }
				}
				else { foreach(v; values) {
						static if (is(typeof(v) == DH5Head)) { _head = v; continue; }
						static if (is(typeof(v) == DH5Body)) { _body = v; continue; }
						_body.add(v); } 
				}
				break;
		}
		return cast(O)this;
	}

	alias add = typeof(super).add;  		

	mixin(OProperty!("DH5Head","head"));
	auto head(this O)(string[] classes) { _head(classes); return cast(O)this;}
	auto head(this O)(string[string] attributes) { _head(attributes); return cast(O)this;}
	//auto head(this O)(string[] classes, string[string] attributes) { _html[0](@safe classes, attributes); return cast(O)this;}
	auto head(this O)(string addContent) { _head(addContent); return cast(O)this;}

	mixin(OProperty!("DH5Body","body_"));
	auto body_(this O)(string[] classes) { _body_(classes); return cast(O)this;}
	auto body_(this O)(string[string] attributes) { _body_(attributes); return cast(O)this;}
	auto body_(this O)(string[] classes, string[string] attributes) { _body_(classes, attributes); return cast(O)this;}
	auto body_(this O)(string addContent) { _body_(addContent); return cast(O)this;}
	auto body_(this O)(DH5Obj[] addContent...) { _body_(addContent); return cast(O)this;}
	auto body_(this O)(DH5Obj[] addContent) { _body_(addContent); return cast(O)this;}
		
	void opBinary(string op, T...)(T values) { static if ((op == "+") || (op == "~")) Add(values); }

/* 	O scripts(this O)(string[] links) { _body.scripts(links); return cast(O)this; }
	O script(this O, T...)(T values) { _body.script(values);  return cast(O)this; }
 */
	override string toString() { 
	return h5Doctype~H5Obj(_id, _classes, _attributes, _head, _body_).tag("html").toString; }
}
mixin(H5Short!"Html");

unittest {
	writeln(H5Html);
	assert(Assert(H5Html,"<!doctype html><html><head></head><body></body></html>"));
	assert(Assert(H5Html(["lang":"en"]),"<!doctype html><html lang=\"en\"><head></head><body></body></html>"));
}
