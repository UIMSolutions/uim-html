module uim.html.apps.views.components.component;

@safe:
import uim.html;

class DH5AppViewComponent {
  this() {}
  this(DH5AppView aView) { this().view(aView); }

  mixin(OProperty!("DH5AppView", "view"));

    // Name of model
	mixin(OProperty!("string", "name"));
	unittest {
		version(uim_html) {
			// TODO
			}}


  // #region Error handling
    protected string _error;
    string error() { return _error; };
    O error(this O)(string newError) { 
      _error = newError;
      if (hasError) debug writeln("[ERROR] ", _error);
      return cast(O)this; }

    bool hasError() { 
      return (_error.length > 0); }

    bool noError() { 
      return (_error.length == 0); }
    
    unittest {
      version(uim_html) {
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

  // #region h5 content
    // Default h5Content
    mixin(OProperty!("DH5Obj[]", "defaultH5Content"));

    protected DH5Obj[] _h5Content;
    void beforeH5(STRINGAA options = null) {
      // init
      _error = null; // Delete last error
      _h5Content = defaultH5Content ? defaultH5Content.dup : null; // Copy default
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
    // Default content
    mixin(OProperty!("string", "defaultContent"));
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
      _rendered = defaultContent;
      return;
    }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    void afterRender(STRINGAA options = null) {
      return; }
    unittest {
      version(uim_html) {
        // TODO Add Test
        }}

    string render(STRINGAA options = null) {
      // this.dispatchEvent("View.beforeRender", [templateFileName]);
      beforeRender(options);
      if (hasError) { debug writeln("[ERROR] ", error); return null; }
      
      _rendered ~= toH5(options).map!(a => a.toString).join;
      if (hasError) { debug writeln("[ERROR] ", error); return null; }

      // this.Blocks.set("content", this._render(templateFileName));
      // this.dispatchEvent("View.afterRender", [templateFileName]);
      afterRender(options);
      if (hasError) { debug writeln("[ERROR] ", error); return null; }

      return _rendered; }
    unittest {
      version(uim_html) {
        /// TODO
      }}
  // #endregion render 

  // #region convert
    /* T opCast(T : DH5Obj[])() { return toH5(); } */
    override string toString() { return render(); }
    string toString(STRINGAA options) { return render(options); }
  // #endregion convert
}
auto H5AppViewComponent() { return new DH5AppViewComponent; }