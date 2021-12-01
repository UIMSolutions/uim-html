module uim.html.apps.views.view;

@safe:
import uim.html;

class DH5AppView : DH5AppObj {
	this() { super(); _name = "View"; }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }
}
auto H5AppView() { return new DH5AppView(); }
auto H5AppView(DH5App anApp) { return new DH5AppView(anApp); }
auto H5AppView(string aName) { return new DH5AppView(aName); }
auto H5AppView(DH5App anApp, string aName) { return new DH5AppView(anApp, aName); }

unittest {
	assert(H5AppView.name == "View");
	assert(H5AppView.name("newView").name == "newView");
}
