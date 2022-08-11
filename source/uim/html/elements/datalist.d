module uim.html.elements.datalist;

@safe:
import uim.html;

class DH5Datalist : DH5Obj {
	mixin(H5This!"datalist");

	mixin(MyContent!("option", "H5Option"));
}
mixin(H5Short!"Datalist");

unittest {
  testH5Obj(H5Datalist, "datalist");
}
