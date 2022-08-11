module uim.html.elements.script;

@safe:
import uim.html;

class DH5Script : DH5Obj {
	mixin(H5This!"script");
}
mixin(H5Short!"Script");

version(test_uim_html) { unittest {
    // assert(H5Script,"<script></script>");
}}

string toString(DH5Script[] scripts) {
	string result;
	foreach(script; scripts) result ~= script.toString;
	return result; }
version(test_uim_html) { unittest {
    // assert([H5Script, H5Script].toString == "<script></script><script></script>");
}}

DH5Script[] H5Scripts(string[string][] scripts...) { return H5Scripts(scripts); }
DH5Script[] H5Scripts(string[string][] scripts) { 
	DH5Script[] results;
	foreach(script; scripts) results ~= H5Script(script);
	return results;
}
version(test_uim_html) { unittest {
		// TODO
}}
