module uim.html.apps.data;

import uim.html;

@safe class DH5AppData : DH5AppObj {
	this() { super(); _name = "data"; this.mimetype("text/json"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }
}
auto H5AppData() { return new DH5AppData(); }
auto H5AppData(DH5App anApp) { return new DH5AppData(anApp); }
auto H5AppData(string aName) { return new DH5AppData(aName); }
auto H5AppData(DH5App anApp, string aName) { return new DH5AppData(anApp, aName); }

unittest {
	assert(H5AppData.name == "data");
	assert(H5AppData.name("newData").name == "newData");
}
