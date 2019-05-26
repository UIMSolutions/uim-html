module uim.html.elements.video;

import uim.html;

class DH5VIDEO : DH5Obj {
	mixin(H5This!"VIDEO");

	mixin(MyAttribute!"autoplay");
    mixin(MyAttribute!"buffered");
    mixin(MyAttribute!"controls");
    mixin(MyAttribute!"crossorigin");
    mixin(MyAttribute!"height");
    mixin(MyAttribute!"loop");
    mixin(MyAttribute!"muted");
    mixin(MyAttribute!"played");
    mixin(MyAttribute!"preload");
    mixin(MyAttribute!"poster");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"width");
    mixin(MyAttribute!"playsinline");	
	
	mixin(MyContent!("source", "H5SOURCE"));
	mixin(MyContent!("track", "H5TRACK"));
}
mixin(FuncH5!"VIDEO");

unittest {
	writeln("Testing ", __MODULE__);
	
	mixin(H5Test!("H5VIDEO", "video"));
	
	assert(H5VIDEO.autoplay("true") == `<video autoplay></video>`);
	assert(H5VIDEO.buffered("aValue") == `<video buffered="aValue"></video>`);
	assert(H5VIDEO.controls("aValue") == `<video controls></video>`);
	assert(H5VIDEO.crossorigin("anonymous") == `<video crossorigin="anonymous"></video>`);
	assert(H5VIDEO.height("aValue") == `<video height="aValue"></video>`);
	assert(H5VIDEO.loop("true") == `<video loop></video>`);
	assert(H5VIDEO.muted("true") == `<video muted></video>`);
	assert(H5VIDEO.played("aValue") == `<video played="aValue"></video>`);
	assert(H5VIDEO.preload("aValue") == `<video preload="aValue"></video>`);
	assert(H5VIDEO.poster("aValue") == `<video poster="aValue"></video>`);
	assert(H5VIDEO.src("aValue") == `<video src="aValue"></video>`);
	assert(H5VIDEO.width("aValue") == `<video width="aValue"></video>`);
	assert(H5VIDEO.playsinline("aValue") == `<video playsinline="aValue"></video>`);
}
