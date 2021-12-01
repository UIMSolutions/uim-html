module uim.html.apps.views.view;

@safe:
import uim.html;

class DH5AppView   {
	this() { _name = "View"; }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }

  // App of View
  mixin(OProperty!("DH5App", "app"));
	unittest {
		version(uim_html) {
			assert(H5AppView(H5App("test")).app.name == "test");
			assert(H5AppView(H5App("test")).app(H5App("test2")).app.name == "test2");
			}}

  // Name of model
	mixin(OProperty!("string", "name"));
	unittest {
		version(uim_html) {
			// TODO
			}}

  // Current error
	mixin(OProperty!("string", "error"));
	unittest {
		version(uim_html) {
			// TODO
			}}

  void beforeH5(STRINGAA options = null) {
    return;
  }
  unittest {
		version(uim_html) {
			// TODO
			}}

  void afterH5(STRINGAA options = null) {
    return;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}

  DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}

  void beforeRender(STRINGAA options = null) {
    return;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}

  void afterRender(STRINGAA options = null) {
    return; 
  }
	unittest {
		version(uim_html) {
			// TODO
			}}

  string render(STRINGAA options = null) {
    beforeRender(options);
    auto result = toH5(options).map!(a => a.toString).join;
    afterRender(options);
    return result;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}  
}
auto H5AppView() { return new DH5AppView(); }
auto H5AppView(DH5App anApp) { return new DH5AppView(anApp); }
auto H5AppView(string aName) { return new DH5AppView(aName); }
auto H5AppView(DH5App anApp, string aName) { return new DH5AppView(anApp, aName); }

unittest {
  version(uim_html) {
    assert(H5AppView.name == "View");
    assert(H5AppView.name("newView").name == "newView");
    }}
