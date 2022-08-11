module uim.html.elements.th;

@safe:
import uim.html;

class DH5Th : DH5Obj {
	mixin(H5This!"th");
}
mixin(H5Calls!("H5Th", "DH5Th"));

version(test_uim_html) { unittest {
    // assert(H5Th == "<th></th>");
}}
