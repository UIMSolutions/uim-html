module uim.html.elements.datalist;
@safe:
import uim.html;

@safe class DH5Datalist : DH5Obj {
	mixin(H5This!"datalist");

	mixin(MyContent!("option", "H5Option"));
}
mixin(H5Short!"Datalist");

unittest {
	assert(Assert(H5Datalist,"<datalist></datalist>"));
}
