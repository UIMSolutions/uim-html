module uim.html.elements.label;

import uim.html;

class DH5LABEL : DH5Obj {
	mixin(H5This!"LABEL");

	mixin(MyAttribute!("forId", "for"));
	mixin(MyAttribute!("form"));
}
mixin(FuncH5!"LABEL");

unittest {
	

	mixin(H5Test!("H5LABEL", "label"));
	assert(H5LABEL.forId("anID") == `<label for="anID"></label>`);
	assert(H5LABEL.form("aForm") == `<label form="aForm"></label>`);
	assert(H5LABEL.forId("anID").content("text") == `<label for="anID">text</label>`);
	assert(H5LABEL.form("aForm").content("text") == `<label form="aForm">text</label>`);
}
