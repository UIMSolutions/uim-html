module uim.html.elements.a;

import uim.html;

/**
 * DH5A, H5A, H5.A defines a hyperlink to link from one page to another.
The href attribute indicates the link's destination.
Hint: By default, links will appear as follows in all browsers:
    An unvisited link is underlined and blue
    A visited link is underlined and purple
    An active link is underlined and red
*/

/**
 * Hyperlinks, auch „Verweise“ genannt, werden durch a-Elemente realisiert. 
 * Sie sind ein entscheidender Bestandteil jedes Hypertext-Projekts und der „intelligente Mehrwert“ des World Wide Web. a bedeutet anchor, Anker, 
 * weil ein anderes Dokument durch einen Link verankert wird.  
 */
class DH5A : DH5Obj {
	mixin(H5This!"A");

	 mixin(MyAttribute!"download");
	 mixin(MyAttribute!"href");
	 mixin(MyAttribute!"hreflang");
	 mixin(MyAttribute!"ping");
	 mixin(MyAttribute!"referrerpolicy");
	 mixin(MyAttribute!"rel");
	 mixin(MyAttribute!"target");
	 mixin(MyAttribute!"type");
}
mixin(FuncH5!"A");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5A == "<a></a>");
//	`;
//
//	mixin(H5Test!("H5A", "a"));
//	
//	assert(H5A.download("aValue") == `<a download="aValue"></a>`);
//	assert(H5A.href("aValue") == `<a href="aValue"></a>`);
//	assert(H5A.hreflang("aValue") == `<a hreflang="aValue"></a>`);
//	assert(H5A.ping("aValue") == `<a ping="aValue"></a>`);
//	assert(H5A.referrerpolicy("aValue") == `<a referrerpolicy="aValue"></a>`);
//	assert(H5A.rel("aValue") == `<a rel="aValue"></a>`);
//	assert(H5A.target("aValue") == `<a target="aValue"></a>`);
//	assert(H5A.type("aValue") == `<a type="aValue"></a>`);
}
