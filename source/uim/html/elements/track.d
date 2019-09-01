module uim.html.elements.track;

import uim.html;

class DH5Track : DH5Obj {
	mixin(H5This!"track");
	
	mixin(MyAttribute!("isDefault", "default"));
    mixin(MyAttribute!"label");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"srclang");
}
mixin(H5Short!"Track");

unittest {
	mixin(H5Test!("H5Track", "track"));

	assert(H5Track.isDefault("true") == `<track default></track>`);
	assert(H5Track.label("aValue") == `<track label="aValue"></track>`);
	assert(H5Track.src("aValue") == `<track src="aValue"></track>`);
	assert(H5Track.srclang("aValue") == `<track srclang="aValue"></track>`);
}
