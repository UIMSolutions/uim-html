module uim.html.elements.address;

@safe:
import uim.html;

// Wrapper for <address> - indicates that the enclosed HTML provides contact information for a person or people, or for an organization.
class DH5Address : DH5Obj {
	mixin(H5This!"address");
}
mixin(H5Short!"Address");

version(test_uim_html) { unittest {
	// testH5Obj(H5Address, "address");
}}

/**
<address>
Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
Visit us at:<br>
Example.com<br>
Box 564, Disneyland<br>
USA
</address>
*/
