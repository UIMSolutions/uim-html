module uim.html.elements.input;

import uim.html;

class DH5INPUT : DH5Obj {
	mixin(H5This!("INPUT", null, null, true));

	mixin(MyAttribute!("type"))	;
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
mixin(FuncH5!("INPUT"));

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5INPUT == "<input>");
}
