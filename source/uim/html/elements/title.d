module uim.html.elements.title;
@safe:
import uim.html;

@safe class DH5Title : DH5Obj {
	mixin(H5This!("title"));
}
mixin(H5Short!"Title");

unittest {
	assert(Assert(H5Title, "<title></title>"));
}
