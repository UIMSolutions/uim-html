module uim.html.apps.models.model;

@safe:
import uim.html;

class DH5AppModel {
	this() { _name = "Model"; }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }

  // App of Model
  mixin(OProperty!("DH5App", "app"));
	unittest {
		version(uim_html) {
			assert(H5AppModel(H5App("test")).app.name == "test");
			assert(H5AppModel(H5App("test")).app(H5App("test2")).app.name == "test2");
			}}

  // Name of model
	mixin(OProperty!("string", "name"));
}
auto H5AppModel() { return new DH5AppModel(); }
auto H5AppModel(DH5App anApp) { return new DH5AppModel(anApp); }
auto H5AppModel(string aName) { return new DH5AppModel(aName); }
auto H5AppModel(DH5App anApp, string aName) { return new DH5AppModel(anApp, aName); }

unittest {
  version(uim_html) {
    assert(H5AppModel.name == "Model");
    assert(H5AppModel.name("newModel").name == "newModel");
    }}

