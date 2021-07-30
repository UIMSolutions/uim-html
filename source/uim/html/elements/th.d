module uim.html.elements.th;
@safe:
import uim.html;

@safe class DH5Th : DH5Obj {
	mixin(H5This!"th");
}
mixin(H5Calls!("H5Th", "DH5Th"));

unittest {
	assert(Assert(H5Th,"<th></th>"));
}
