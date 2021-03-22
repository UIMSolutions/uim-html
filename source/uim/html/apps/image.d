module uim.html.apps.image;

import uim.html;

 @safe class DH5AppImage : DH5AppObj {
	this() { super(); _name = "image"; }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }
}
auto H5AppImage() { return new DH5AppImage(); }
auto H5AppImage(DH5App anApp) { return new DH5AppImage(anApp); }
auto H5AppImage(string aName) { return new DH5AppImage(aName); }
auto H5AppImage(DH5App anApp, string aName) { return new DH5AppImage(anApp, aName); }

unittest {
	assert(H5AppImage.name == "image");
	assert(H5AppImage.name("newImage").name == "newImage");
}
