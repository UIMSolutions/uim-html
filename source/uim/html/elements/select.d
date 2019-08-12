module uim.html.elements.select;

import uim.html;

class DH5SELECT : DH5Obj {
	mixin(H5This!"SELECT");

	mixin(TProperty!("string", "selected"));
	mixin(TProperty!("string[string]", "options"));
	mixin(TProperty!("bool", "sorted"));

	mixin(MyContent!("option", "H5OPTION"));

}
mixin(FuncH5!"SELECT");

unittest {
	
	
	mixin(H5Test!("H5SELECT", "select"));
	
	assert(H5SELECT.option(["value":"aValue"]) == `<select><option value="aValue"></option></select>`);
	assert(H5SELECT.option(["value":"aValue"], "someContent") == `<select><option value="aValue">someContent</option></select>`);
}
