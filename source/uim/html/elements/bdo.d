module uim.html.elements.bdo;
@safe:
import uim.html;

@safe class DH5Bdo : DH5Obj {
	mixin(H5This!"bdo");
}
mixin(H5Short!"Bdo");

unittest {
	assert(Assert(H5Bdo,"<bdo></bdo>"));
}
