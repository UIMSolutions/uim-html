module uim.html.elements.video;

import uim.html;

@safe class DH5Video : DH5Obj {
	mixin(H5This!"video");

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
	
	mixin(MyContent!("source", "H5Source"));
	mixin(MyContent!("track", "H5Track"));
}
mixin(H5Short!"Video");

unittest {
	mixin(H5Test!("H5Video", "video"));
	
	assert(Assert(H5Video.autoplay("true"), `<video autoplay></video>`));
	assert(Assert(H5Video.buffered("aValue"), `<video buffered="aValue"></video>`));
	assert(Assert(H5Video.controls("aValue"), `<video controls></video>`));
	assert(Assert(H5Video.crossorigin("anonymous"), `<video crossorigin="anonymous"></video>`));
	assert(Assert(H5Video.height("aValue"), `<video height="aValue"></video>`));
	assert(Assert(H5Video.loop("true"), `<video loop></video>`));
	assert(Assert(H5Video.muted("true"), `<video muted></video>`));
	assert(Assert(H5Video.played("aValue"), `<video played="aValue"></video>`));
	assert(Assert(H5Video.preload("aValue"), `<video preload="aValue"></video>`));
	assert(Assert(H5Video.poster("aValue"), `<video poster="aValue"></video>`));
	assert(Assert(H5Video.src("aValue"), `<video src="aValue"></video>`));
	assert(Assert(H5Video.width("aValue"), `<video width="aValue"></video>`));
	assert(Assert(H5Video.playsinline("aValue"), `<video playsinline="aValue"></video>`));
}
