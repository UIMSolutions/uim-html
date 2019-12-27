module uim.html.extras.string;

import uim.html;

class DH5String : DH5Obj {
	private string _content;
    this(string aContent) { _content = aContent; }
    override string toString() { return _content; }
}
DH5String H5String(string text) { return new DH5String(text); }
