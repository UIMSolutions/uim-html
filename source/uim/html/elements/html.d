module uim.html.elements.html;

import uim.html;

/**
 * DH5HTML - Wrapper for the html-Element
 * Das html-Element, auch root(-Element) oder Wurzelelement enthält den vollständigen Inhalt einer Internetseite. 
 * Date: January 09, 2015
 */
class DH5HTML : DH5Obj {
	mixin(H5This!"HTML");

	 override public void init() {
		super.init;

		_head = H5HEAD;
		_body = H5BODY;
	}

	 void Add(T...)(T values) { _body.Add(values); }

	 O Add(this O, T...)(T values) { 
		switch (values.length) {
			case 0: break; 
			case 1: 
				static if (is(typeof(values[0]) == DH5HEAD)) _head = values[0];
				else if (is(typeof(values[0]) == DH5BODY)) _body = values[0];
				else _body.add(values[0]); break;
			default: 
				static if ((is(typeof(values[0]) == string)) && ((is(typeof(values[1]) == string[])) || (is(typeof(values[1]) == string[string])))) { 
					_id = values[0]; foreach(v; values[1..$]) {
						static if (is(typeof(v) == DH5HEAD)) { _head = v; continue; }
						static if (is(typeof(v) == DH5BODY)) { _body = v; continue; }
						_body.add(v); }
				}
				else { foreach(v; values) {
						static if (is(typeof(v) == DH5HEAD)) { _head = v; continue; }
						static if (is(typeof(v) == DH5BODY)) { _body = v; continue; }
						_body.add(v); } 
				}
				break;
		}
		return cast(O)this;
	};

	alias add = typeof(super).add;  		

	mixin(TProperty!("DH5HEAD", "head"));
	mixin(TProperty!("DH5BODY", "body"));
		
	 void opBinary(string op, T...)(T values) { static if ((op == "+") || (op == "~")) Add(values); }

	 O scripts(this O)(string[] links) { _body.scripts(links); return cast(O)this; }
	 O script(this O, T...)(T values) { _body.script(values);  return cast(O)this; }

	 override string toString() { 
		_html = _head.toString ~ _body.toString; 
		return h5Doctype~super.toString; }
}
mixin(FuncH5!"HTML");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5HTML == "<!doctype html><html><head></head><body></body></html>");
	assert(H5HTML(["lang":"en"]) == "<!doctype html><html lang=\"en\"><head></head><body></body></html>");
//	writeln(H5HTML.HEAD(H5META, H5SCRIPT, H5STYLE));
//	writeln(H5HTML.BODY(H5DIV, H5SCRIPT, H5STYLE));
//	writeln(H5HTML.HEAD(H5META, H5SCRIPT, H5STYLE).BODY(H5DIV, H5SCRIPT, H5STYLE));
}
