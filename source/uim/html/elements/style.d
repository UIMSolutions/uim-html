module uim.html.elements.style;

@safe:
import uim.html;

class DH5Style : DH5Obj {
	mixin(H5This!("style"));
}
mixin(H5Short!"Style");
version(test_uim_html) { unittest {
    // testH5Obj(H5Style, "style");
}

string toString(DH5Style[] styles) {
	string result;
	foreach(style; styles) result ~= style.toString;
	return result;
}
version(test_uim_html) { unittest {
    assert([H5Style, H5Style].toString == "<style></style><style></style>");
}

DH5Style[] H5Styles(string[string][] styles...) { return H5Styles(styles); }
DH5Style[] H5Styles(string[string][] styles) { 
	DH5Style[] results;
	foreach(style; styles) results ~= H5Style(style);
	return results;
}
version(test_uim_html) { unittest {
		/// TODO
}