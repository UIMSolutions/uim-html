module uim.html.elements.source;

import uim.html;

class DH5Source : DH5Obj {
	mixin(H5This!"source");
	
	mixin(MyAttribute!"sizes");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"srcset");
    mixin(MyAttribute!"type");
    mixin(MyAttribute!"media"); 
}
mixin(H5Short!"Source");

unittest {
	mixin(H5Test!("H5Source", "source"));

	assert(H5Source.sizes("aValue") == `<source sizes="aValue"></source>`);
	assert(H5Source.src("aValue") == `<source src="aValue"></source>`);
	assert(H5Source.srcset("aValue") == `<source srcset="aValue"></source>`);
	assert(H5Source.type("aValue") == `<source type="aValue"></source>`);
	assert(H5Source.media("aValue") == `<source media="aValue"></source>`);
}
