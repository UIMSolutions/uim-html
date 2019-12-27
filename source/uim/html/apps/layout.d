module uim.html.apps.layout;

import uim.html;

/// Page layout
class DH5AppLayout {
	this() { }

	string opCall(string content, string[string] parameters = null) { return toString(content, parameters); }
	string toString(string content, string[string] parameters = null) {
		return content;
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {
	assert(H5AppLayout.toString("") == "");
	assert(H5AppLayout()("") == "");
	assert(H5AppLayout.toString("test") == "test");
	assert(H5AppLayout()("test") == "test");
}
