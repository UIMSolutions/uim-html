module uim.html.apps.controllers.script;

@safe:
import uim.html;

class DH5AppScript : DH5AppController {
	this() { super(); this.mimetype("application/javascript"); }
	this(DH5App anApp) { this().app(anApp).mimetype("application/javascript"); }
	this(string aName) { this().name(aName).mimetype("application/javascript"); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName).mimetype("application/javascript"); }

	/// TODO bind variables
}
auto H5AppScript() { return new DH5AppScript(); }
auto H5AppScript(DH5App anApp) { return new DH5AppScript(anApp); }
auto H5AppScript(string aName) { return new DH5AppScript(aName); }
auto H5AppScript(DH5App anApp, string aName) { return new DH5AppScript(anApp, aName); }

unittest {
	version(uim_html) {
		// TODO Add Test
		}}