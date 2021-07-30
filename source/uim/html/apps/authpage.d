module uim.html.apps.authpage;
@safe:
import uim.html;

@safe class DH5AuthAppPage : DH5AppPage {
	this() { super(); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this(anApp).name(aName); }

  mixin(SProperty!("string", "authToken"));
  mixin(SProperty!("string", "sessionToken"));

	override void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    this.authToken(reqParameters.get("authToken", ""));
    this.sessionToken(reqParameters.get("sessionToken", ""));
    super.request(req, res, reqParameters);
	}
}
 auto H5AuthAppPage() { return new DH5AuthAppPage(); }
 auto H5AuthAppPage(string aName) { return new DH5AuthAppPage(aName); }
 auto H5AuthAppPage(DH5App anApp) { return new DH5AuthAppPage(anApp); }
 auto H5AuthAppPage(DH5App anApp, string aName) { return new DH5AuthAppPage(anApp, aName); }
