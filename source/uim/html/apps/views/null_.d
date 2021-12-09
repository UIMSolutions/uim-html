module uim.html.apps.views.null_;

@safe:
import uim.html;

class DH5NullView : DH5AppView {
  this() { super(); this.name = "H5NullView"; }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}  

  override string render(STRINGAA options = null) {
    return null;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}  
}
auto H5NullView() { return new DH5NullView(); }
auto H5NullView(DH5AppController aController) { return new DH5NullView(aController); }
auto H5NullView(string aName) { return new DH5NullView(aName); }
auto H5NullView(DH5AppController aController, string aName) { return new DH5NullView(aController, aName); }

unittest {
  version(uim_html) {
    assert(H5NullView.name == "H5NullView");
    assert(H5NullView.name("newView").name == "newView");
}}
