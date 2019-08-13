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
	mixin(H5This!"a");

	/* download specifies that the target (a file) will be downloaded when a user clicks on the link (attribute href) instead of navigating to the file). */
	/* if value not empty ("") => new filename for the downloaded file. */
	mixin(MyAttribute!"download");
	unittest {
		assert(H5A.download("download") == `<a download="download"></a>`);
		assert(H5A.download("fileName.txt") == `<a download="fileName.txt"></a>`);
	}

	/* href specifies the URL of the page goes to. */
	mixin(MyAttribute!"href");
	unittest {
		assert(H5A.href("test.html") == `<a href="test.html"></a>`);
		//  <a href="javascript:alert('Hello World!');">Execute JavaScript</a> 
	}

	mixin(MyAttribute!"hreflang");
	unittest {
		assert(H5A.hreflang("test") == `<a hreflang="test"></a>`);
	}

	mixin(MyAttribute!"ping");
	unittest {
		assert(H5A.ping("test") == `<a ping="test"></a>`);
	}

	mixin(MyAttribute!"referrerpolicy");
	unittest {
		assert(H5A.referrerpolicy("test") == `<a referrerpolicy="test"></a>`);
	}

	mixin(MyAttribute!"rel");
	unittest {
		assert(H5A.rel("test") == `<a rel="test"></a>`);
	}
	mixin(MyAttribute!"target");
	unittest {
		assert(H5A.target("test") == `<a target="test"></a>`);
	}

	mixin(MyAttribute!"type");
	unittest {
		assert(H5A.type("test") == `<a type="test"></a>`);
	}
}
mixin(FuncH5!"A");

unittest {
	assert(H5A == "<a></a>");
}
