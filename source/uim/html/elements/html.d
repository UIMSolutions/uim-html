module uim.html.elements.html;

import uim.html;

/**
 * DH5Html - Wrapper for the html-Element
 * Das html-Element, auch root(-Element) oder Wurzelelement enthält den vollständigen Inhalt einer Internetseite. 
 * Date: January 09, 2015
 */
class DH5Html : DH5Obj {
	mixin(H5This!"html");

	override public void _init() {
		super._init;

		this.content(H5Head, H5Body);
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

	auto head() { return cast(DH5Head)_html[0]; }
	auto head(this O)(DH5Head newHead) { _html[0] = newHead; return cast(O)this;}
	auto head(this O)(string[] classes) { _html[0](classes); return cast(O)this;}
	auto head(this O)(string[string] attributes) { _html[0](attributes); return cast(O)this;}
	auto head(this O)(string addContent) { _html[0](addContent); return cast(O)this;}

	auto body_() { return cast(DH5Body)_html[1]; }
	auto body_(this O)(DH5Body newBody) { _html[1] = newBody; return cast(O)this; }
	auto body_(this O)(string[] classes) { _html[1](classes); return cast(O)this;}
	auto body_(this O)(string[string] attributes) { _html[1](attributes); return cast(O)this;}
	auto body_(this O)(string addContent) { _html[1](addContent); return cast(O)this;}
		
	void opBinary(string op, T...)(T values) { static if ((op == "+") || (op == "~")) Add(values); }

	O scripts(this O)(string[] links) { _body.scripts(links); return cast(O)this; }
	O script(this O, T...)(T values) { _body.script(values);  return cast(O)this; }

	override string toString() { 
	return h5Doctype~super.toString; }
}
mixin(H5Short!"Html");

unittest {
	assert(Assert(H5Html,"<!doctype html><html><head></head><body></body></html>"));
	assert(Assert(H5Html(["lang":"en"]),"<!doctype html><html lang=\"en\"><head></head><body></body></html>"));
}
