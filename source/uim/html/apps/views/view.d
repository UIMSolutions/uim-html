module uim.html.apps.views.view;

@safe:
import uim.html;

class DH5AppView {
	this() { this.name = "H5AppView"; }
  this(DH5AppController aController) { this().controller(aController); }
	this(string aName) { this().name(aName); }
	this(DH5AppController aController, string aName) { this(aController).name(aName); }

  mixin(OProperty!("DH5AppLayout", "layout"));

  // App of View
  mixin(OProperty!("DH5AppController", "controller"));
	unittest {
		version(uim_html) {
      //
			}}

  protected DH5App _app;
  DH5App app() {
    if (_app) return _app;
    return controller ? controller.app : null; }

  // Name of model
	mixin(OProperty!("string", "name"));
	unittest {
		version(uim_html) {
			// TODO
			}}


  // #region Error handling
    mixin(OProperty!("string", "error"));

    bool hasError() { 
      return (_error.length > 0); }

    bool noError() { 
      return (_error.length == 0); }
    
    unittest {
      version(uim_apps) {
        auto component = H5AppViewComponent;
        assert(!component.hasError); // has no error
        assert(component.noError); // has no error
        component.error("Database lost");
        assert(component.hasError); // has a error
        assert(!component.noError); // has a error
        component.error(null); 
        assert(!component.hasError); // has no error
        assert(component.noError); // has no error
        }}
  // #endregion Error handling

  // Default content
  mixin(OProperty!("DH5Obj[]", "content"));

  // #region h5 content
    protected DH5Obj[] _h5Content;
    void beforeH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::beforeH5"); 
      // init
      _error = null; // Delete last error
      _h5Content = _content ? _content.dup : null; // Copy default
      return;
    }
    unittest {
      version(uim_html) {
        // TODO
    }}

    void afterH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::afterH5"); 
      return;
      }
    unittest {
      version(uim_html) {
        // TODO
        }}

    DH5Obj[] toH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::toH5"); 
      beforeH5(options);
      if (hasError) { debug writeln("[ERROR] ", error); return null; }

      afterH5(options); 

      return _h5Content; }
      unittest {
        version(uim_html) {
          // TODO
        }}
  // #endregion h5 content

  // #region render
    /**
     * Renders view
     *
     * Render triggers helper callbacks, which are fired before and after the template are rendered.
     * The helper callbacks are called:
     *
     * - `beforeRender`
     * - `afterRender`
     */
    string _rendered;
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::beforeRender"); 
      _rendered = null;
    }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    void afterRender(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::afterRender"); 
      return; }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    string render(STRINGAA options = null) {
      debugMethodCall(moduleName!DH5AppView~":DH5AppView::render"); 
      // this.dispatchEvent("View.beforeRender", [templateFileName]);
      beforeRender(options);
      if (hasError) { return null; }
      
      auto preRender = toH5(options).map!(a => a.toString).join;
      _rendered ~= layout ? layout.render(controller, preRender) : preRender ;
      debug writeln("_rendered = '", _rendered, "'"); 
      if (hasError) { return null; }

      // this.Blocks.set("content", this._render(templateFileName));
      // this.dispatchEvent("View.afterRender", [templateFileName]);
      afterRender(options);
      if (hasError) { return null; }

      return _rendered; }
    unittest {
      version(uim_html) {
        /// TODO
      }}
  // #endregion render 

  // #region convert
    /* T opCast(T = DH5Obj[])() { return this.toH5(); } */
    override string toString() { return this.render(); }
    string toString(STRINGAA options) { return this.render(options); }
  // #endregion convert
}
auto H5AppView() { return new DH5AppView(); }
auto H5AppView(DH5AppController aController) { return new DH5AppView(aController); }
auto H5AppView(string aName) { return new DH5AppView(aName); }
auto H5AppView(DH5AppController aController, string aName) { return new DH5AppView(aController, aName); }

unittest {
  version(uim_html) {
    assert(H5AppView.name == "H5AppView");
    assert(H5AppView.name("newView").name == "newView");
    }}




