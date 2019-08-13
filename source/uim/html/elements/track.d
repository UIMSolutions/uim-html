module uim.html.elements.track;

import uim.html;

class DH5Track : DH5Obj {
	mixin(H5This!"tack");
	
	mixin(MyAttribute!("isDefault", "default"));
    mixin(MyAttribute!"label");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"srclang");
}
mixin(FuncH5!"Track");

unittestr {
	mixin(H5Test!("H5Track", "track"));

	assert(H5Track.isDefault("true") == `<track default></track>`);
	assert(H5Track.label("aValue") == `<track label="aValue"></track>`);
	assert(H5Track.src("aValue") == `<track src="aValue"></track>`);
	assert(H5Track.srclang("aValue") == `<track srclang="aValue"></track>`);
}
