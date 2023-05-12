﻿module uim.html.elements.style;

@safe:
import uim.html;

class DH5Style : DH5Obj {
	mixin(H5This!("style"));
}
mixin(H5Short!"Style");
version(test_uim_html) { unittest {
    testH5Obj(H5Style, "style");
}}

string toString(DH5Style[] someStyles) {
	return someStyles.map!(s => s.toString).join;
}
version(test_uim_html) { unittest {
    // assert([H5Style, H5Style].toString == "<style></style><style></style>");
}}

DH5Style[] H5Styles(string[string][] someStyles...) { 
	return H5Styles(someStyles.dup); 
}

DH5Style[] H5Styles(string[string][] someStyles) { 
	return someStyles.map!(s => H5Style(s)).array;
}
version(test_uim_html) { unittest {
	/// TODO
}}