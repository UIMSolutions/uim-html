module uim.html.apps.js;

import uim.html;

@safe class DH5AppJavascript : DH5AppObj {
	this() { super(); this.mimetype("application/javascript"); }
	this(DH5App anApp) { this().app(anApp).mimetype("application/javascript"); }
	this(string aName) { this().name(aName).mimetype("application/javascript"); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName).mimetype("application/javascript"); }

	/// Export to string
	override string toString(string[string] parameters) {
		if (cached) {
			if (_toString) return _toString;
			if (_content) { _toString = _content; return _toString; }
		}
		string result;
		if (cached) { _toString = result; return _toString; }
		return result; 
	}
}
auto H5AppJavascript() { return new DH5AppJavascript(); }
auto H5AppJavascript(DH5App anApp) { return new DH5AppJavascript(anApp); }
auto H5AppJavascript(string aName) { return new DH5AppJavascript(aName); }
auto H5AppJavascript(DH5App anApp, string aName) { return new DH5AppJavascript(anApp, aName); }

unittest {
}
