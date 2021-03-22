module uim.html.elements.footer;

import uim.html;

@safe class DH5Footer : DH5Obj {
	mixin(H5This!("Footer"));
}
mixin(H5Short!"Footer");

unittest {	
	assert(Assert(H5Footer,"<footer></footer>"));
}
