module uim.html.apps.style;

import uim.html;

/// Style (CSS) of an App
class DH5AppStyle : DH5AppObj {
	this() { super(); this.mimetype("text/css"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }
}
auto H5AppStyle() { return new DH5AppStyle(); }
auto H5AppStyle(DH5App anApp) { return new DH5AppStyle(anApp); }
auto H5AppStyle(string aName) { return new DH5AppStyle(aName); }
auto H5AppStyle(DH5App anApp, string aName) { return new DH5AppStyle(anApp, aName); }

unittest {
	assert(cast(DH5AppStyle)H5AppStyle);
	assert(H5AppStyle(H5App).app !is null);
	assert(H5AppStyle("test").name == "test");
	assert(H5AppStyle(H5App, "test").app !is null);
	assert(H5AppStyle(H5App, "test").name == "test");

	assert(H5AppStyle("test").name("test2").name == "test2");
}
