module uim.html.apps.img;

import uim.html;

class DH5AppImage : DH5AppObj {
	this() { super(); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }
	
	/// Export to string
	override string toString() {
		if (cached) {
			if (_toString) return _toString;
			if (_content) { _toString = _content; return _toString; }
		}
		string result;
		if (cached) { _toString = result; return _toString; }
		return result; 
	}
}
auto H5AppImage() { return new DH5AppImage(); }
auto H5AppImage(DH5App anApp) { return new DH5AppImage(anApp); }
auto H5AppImage(string aName) { return new DH5AppImage(aName); }
auto H5AppImage(DH5App anApp, string aName) { return new DH5AppImage(anApp, aName); }

unittest {
}
