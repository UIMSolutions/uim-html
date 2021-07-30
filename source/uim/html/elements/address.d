module uim.html.elements.address;
@safe:
import uim.html;

/**
 * DH5Address, H5Address defines the contact information for the author/owner of a document or an article.
 * - inside the <body> element, it represents contact information for the document.
 * - inside an <article> element, it represents contact information for that article.
 * Hint: <address> element usually will be rendered in italic. Most browsers are adding a line break before and after the address element.
 */
@safe class DH5Address : DH5Obj {
	mixin(H5This!"address");
}
mixin(H5Short!"Address");

unittest {
	mixin(H5Test!("H5Address", "address"));
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
