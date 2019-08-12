module uim.html.elements.abbr;

import uim.html;

/++
 + DH5ABBR, H5ABBR are wrappers for the html element "abbr". This element represents an abbreviation or acronym. 
+/
class DH5ABBR : DH5Obj {
	mixin(H5This!"ABBR");
}
mixin(FuncH5!"ABBR");

unittest {
	

	mixin(H5Test!("H5ABBR", "abbr"));
}
