module uim.html.elements.script;

import uim.html;

class DH5Script : DH5Obj {
	mixin(H5This!"script");
}
mixin(H5Short!"Script");

unittest {
	assert(Assert(H5Script,"<script></script>"));
}

string toString(DH5Script[] scripts) {
	string result;
	foreach(script; scripts) result ~= script.toString;
	return result;
}
unittest {
	assert([H5Script, H5Script].toString == "<script><script>");
}

DH5Script[] H5Scripts(string[string][] scripts...) { return H5Scripts(scripts); }
DH5Script[] H5Scripts(string[string][] scripts) { 
	DH5Script[] results;
	foreach(script; scripts) results ~= H5Script(script);
	return results;
}
unittest {
	/// TODO
}
