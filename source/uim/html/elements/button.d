module uim.html.elements.button;

import uim.html;

class DH5BUTTON : DH5Obj {
	mixin(H5This!"BUTTON");

	/* type */
//	ButtonTypes _type = ButtonTypes.Button;
//	@property ButtonTypes type() { return _type; }
//	@property O type(this O)(ButtonTypes value) { 
//		_type = value; 
//		attributes["type"] = to!string(value);
//		return cast(O)this; }
}
mixin(FuncH5!"BUTTON");

enum ButtonTypes : string {
	Button = "button",
	Submit = "submit",
	Reset = "reset"
}

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5BUTTON == "<button></button>");

//	assert(H5BUTTON.type(ButtonTypes.Button).attributes["type"] == "button");
//	assert(H5BUTTON.type(ButtonTypes.Reset).attributes["type"] == "submit");
//	assert(H5BUTTON.type(ButtonTypes.Submit).attributes["type"] == "reset");
}
