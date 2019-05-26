module uim.html.elements.source;

import uim.html;

class DH5SOURCE : DH5Obj {
	mixin(H5This!"SOURCE");
	
	mixin(MyAttribute!"sizes");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"srcset");
    mixin(MyAttribute!"type");
    mixin(MyAttribute!"media"); 
}
mixin(FuncH5!"SOURCE");

unittest {
	writeln("Testing ", __MODULE__);
	
	mixin(H5Test!("H5SOURCE", "source"));

	assert(H5SOURCE.sizes("aValue") == `<source sizes="aValue"></source>`);
	assert(H5SOURCE.src("aValue") == `<source src="aValue"></source>`);
	assert(H5SOURCE.srcset("aValue") == `<source srcset="aValue"></source>`);
	assert(H5SOURCE.type("aValue") == `<source type="aValue"></source>`);
	assert(H5SOURCE.media("aValue") == `<source media="aValue"></source>`);
}
