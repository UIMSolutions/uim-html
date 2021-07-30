module uim.html.apps.data;

@safe:@safe:
import uim.html;

class DH5AppData : DH5AppObj {
	this() { super(); _name = "data"; this.mimetype("text/json"); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }

  mixin(SProperty!("bool", "loginRequired"));
  mixin(SProperty!("Json", "login"));

  mixin(SProperty!("bool", "sessionRequired"));
  mixin(SProperty!("Json", "session"));

  override string toString(STRINGAA reqParameters) {
    return toJson(reqParameters).toString;
  }

  Json toJson(STRINGAA reqParameters) {
    auto result = Json.emptyObject;
    result["error"] = 0;
    result["status"] = 201;
    result["messages"] = Json.emptyArray;  

    if (sessionRequired) {
      string sessionId; 
      if (_request.session && _request.session.isKeySet("sessionId")) sessionId = _request.session.get("sessionId", "");
      if ("sessionId" in reqParameters) sessionId = reqParameters["sessionId"];
      if (sessionId.length == 0) {
        result["error"] = 1;
        result["status"] = 409;
        auto errorMessage = Json.emptyObject;
        errorMessage["status"] = "ERROR";
        errorMessage["title"] = "Sitzung nicht gefunden";
        errorMessage["description"] = "Ist Ihre Sitzung abgelaufen? Bitte erneut anmelden.";
        result["messages"] ~= errorMessage;

        return result;
      }     
      result["sessionId"] = sessionId;
      debug writeln("Found sessionId -> ", sessionId);

      if (this.app.dataSource) {
        Json sessionToken = this.app.dataSource.findOne("central", "sessions", ["id":sessionId]);
        if (sessionToken == Json(null)) {
          result["error"] = 1;
          result["status"] = 409;
          auto errorMessage = Json.emptyObject;
          errorMessage["status"] = "ERROR";
          errorMessage["title"] = "Sitzung nicht gefunden";
          errorMessage["description"] = "Ist Ihre Sitzung abgelaufen? Bitte erneut anmelden.";
          result["messages"] ~= errorMessage;

          return result;
        }     
        result["sessionToken"] = sessionToken;
        debug writeln("Found sessionToken -> ", sessionToken);
      }
    }

    return result;
  }
}
auto H5AppData() { return new DH5AppData(); }
auto H5AppData(DH5App anApp) { return new DH5AppData(anApp); }
auto H5AppData(string aName) { return new DH5AppData(aName); }
auto H5AppData(DH5App anApp, string aName) { return new DH5AppData(anApp, aName); }

unittest {
	assert(H5AppData.name == "data");
	assert(H5AppData.name("newData").name == "newData");
}

