module uim.html.extras.string;

import uim.html;

class DH5String : DH5Obj {
	private string _content;
    this(string aContent) { _content = aContent; }
    override string toString() { return _content; }

    override string toPretty(int intendSpace = 0, int step = 2) {
		return _content.indent(intendSpace);
	}
}
DH5String H5String(string text) { return new DH5String(text); }
