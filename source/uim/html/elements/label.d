module uim.html.elements.label;

import uim.html;

class DH5Label : DH5Obj {
	mixin(H5This!"label");

	mixin(MyAttribute!("forId", "for"));
	mixin(MyAttribute!("form"));
}
mixin(FuncH5!"Label");

unittest {
	mixin(H5Test!("H5Label", "label"));
	assert(H5Label.forId("anID") == `<label for="anID"></label>`);
	assert(H5Label.form("aForm") == `<label form="aForm"></label>`);
	assert(H5Label.forId("anID").content("text") == `<label for="anID">text</label>`);
	assert(H5Label.form("aForm").content("text") == `<label form="aForm">text</label>`);
}
