module uim.html.elements.address;

import uim.html;

/**
 * DH5ADDRESS, H5ADDRESS defines the contact information for the author/owner of a document or an article.
 * - inside the <body> element, it represents contact information for the document.
 * - inside an <article> element, it represents contact information for that article.
 * Hint: <address> element usually will be rendered in italic. Most browsers are adding a line break before and after the address element.
 */
class DH5ADDRESS : DH5Obj {
	mixin(H5This!"ADDRESS");
}

mixin(FuncH5!"ADDRESS");

unittest {
	

	mixin(H5Test!("H5ADDRESS", "address"));
}

/**
<address>
Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
Visit us at:<br>
Example.com<br>
Box 564, Disneyland<br>
USA
</address>
*/
