module uim.html.elements.select;

import uim.html;

class DH5Select : DH5Obj {
	mixin(H5This!"select");

	mixin(TProperty!("string", "selected"));
	mixin(TProperty!("string[string]", "options"));
	mixin(TProperty!("bool", "sorted"));

	mixin(MyContent!("option", "H5Option"));

}
mixin(H5Short!"Select");

unittest {
	mixin(H5Test!("H5Select", "select"));
	
	assert(H5Select.option(["value":"aValue"]) == `<select><option value="aValue"></option></select>`);
	assert(H5Select.option(["value":"aValue"], "someContent") == `<select><option value="aValue">someContent</option></select>`);
}
