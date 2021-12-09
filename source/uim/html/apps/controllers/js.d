module uim.html.apps.controllers.js;

@safe:
import uim.html;

class DH5AppJavascript : DH5AppController {
	this() { super(); this.mimetype("application/javascript"); }
	this(DH5App anApp) { this().app(anApp).mimetype("application/javascript"); }
	this(string aName) { this().name(aName).mimetype("application/javascript"); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName).mimetype("application/javascript"); }
}
auto H5AppJavascript() { return new DH5AppJavascript(); }
auto H5AppJavascript(DH5App anApp) { return new DH5AppJavascript(anApp); }
auto H5AppJavascript(string aName) { return new DH5AppJavascript(aName); }
auto H5AppJavascript(DH5App anApp, string aName) { return new DH5AppJavascript(anApp, aName); }

	unittest {
		version(uim_html) {
			// TODO
			}}
