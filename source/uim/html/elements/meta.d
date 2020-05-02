module uim.html.elements.meta;

import uim.html;

class DH5Meta : DH5Obj {
	mixin(H5This!("meta", null, null, true));
}
mixin(H5Short!("Meta"));

unittest {
	assert(Assert(H5Meta, "<meta>"));
}

string toString(DH5Meta[] metas) {
	string result;
	foreach(meta; metas) result ~= meta.toString;
	return result;
}
unittest {
	assert([H5Meta, H5Meta].toString == "<meta><meta>");
}

DH5Meta[] H5Metas(string[string][] metas...) { return H5Metas(metas); }
DH5Meta[] H5Metas(string[string][] metas) { 
	DH5Meta[] results;
	foreach(meta; metas) results ~= H5Meta(meta);
	return results;
}
unittest {
	/// TODO
}
