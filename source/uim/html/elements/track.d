module uim.html.elements.track;

import uim.html;

class DH5TRACK : DH5Obj {
	mixin(H5This!"TRACK");
	
	mixin(MyAttribute!("isDefault", "default"));
    mixin(MyAttribute!"label");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"srclang");
}
mixin(FuncH5!"TRACK");

unittest {
	
	
	mixin(H5Test!("H5TRACK", "track"));

	assert(H5TRACK.isDefault("true") == `<track default></track>`);
	assert(H5TRACK.label("aValue") == `<track label="aValue"></track>`);
	assert(H5TRACK.src("aValue") == `<track src="aValue"></track>`);
	assert(H5TRACK.srclang("aValue") == `<track srclang="aValue"></track>`);
}
