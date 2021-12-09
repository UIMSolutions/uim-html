module uim.html.apps.controllers.components.component;

@safe:
import uim.html;

class DH5AppControllerComponent {
	this() { }
	this(DH5AppController myController) { 
    this.controller(myController); }
		
	mixin(OProperty!("DH5AppController", "controller")); // Owner 
	mixin(OProperty!("string", "name")); // Name of component

	mixin(OProperty!("DH5AppView", "view")); // Linked view
	mixin(OProperty!("DH5AppControllerComponent[]", "components")); // Cascading controllers

	protected string _responseResult;
	void beforeResponse(STRINGAA options = null) {
		_responseResult = view.render(options); }

  string response(STRINGAA options = null) {
    return _responseResult; }

}
auto H5AppControllerComponent() { return new DH5AppControllerComponent(); }
auto H5AppControllerComponent(DH5AppController myController) { return new DH5AppControllerComponent(myController); }
