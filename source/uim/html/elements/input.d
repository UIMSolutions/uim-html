module uim.html.elements.input;

import uim.html;

class DH5Input : DH5Obj {
	mixin(H5This!("input", null, null, true));
	unittest {
		assert(Assert(H5Input,"<input>"));
	}

	mixin(MyAttribute!("type"))	;
	unittest {
		assert(Assert(H5Input.type("text"), `<input type="text">`));
	}

	mixin(MyAttribute!("accept"));
	mixin(MyAttribute!("autoComplete"));
	mixin(MyAttribute!("autofocus"));
	mixin(MyAttribute!("capture"));
	mixin(MyAttribute!("checked"));
	mixin(MyAttribute!("disabled"));
	
	mixin(MyAttribute!("form"));
	mixin(MyAttribute!("formAction"));
	mixin(MyAttribute!("formEnctype"));
	mixin(MyAttribute!("formMethod"));
	mixin(MyAttribute!("formNoValidate"));
	mixin(MyAttribute!("formTarget"));
	
	mixin(MyAttribute!("height"));
	mixin(MyAttribute!("list"));
	mixin(MyAttribute!("maxLength"));
	mixin(MyAttribute!("min"));
	mixin(MyAttribute!("minLength"));
	mixin(MyAttribute!("multiple"));
	mixin(MyAttribute!("pattern"));
	mixin(MyAttribute!("placeHolder"));
	mixin(MyAttribute!("readOnly"));
	mixin(MyAttribute!("required"));
	
	mixin(MyAttribute!("selectionDirection"));
	mixin(MyAttribute!("selectionEnd"));
	mixin(MyAttribute!("selectionStart"));
	mixin(MyAttribute!("size"));
	mixin(MyAttribute!("src"));
	mixin(MyAttribute!("step"));
	mixin(MyAttribute!("value"));
	mixin(MyAttribute!("width"));
}
mixin(H5Short!("Input"));

unittest {
}
