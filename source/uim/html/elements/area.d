module uim.html.elements.area;

import uim.html;

/**
 * The <area> tag defines an area inside an image-map (an image-map is an image with clickable areas).

The <area> element is always nested inside a <map> tag.

Note: The usemap attribute in the <img> tag is associated with the <map> element's name attribute, and creates a relationship between the image and the map.
*/
@safe class DH5Area : DH5Obj {
	mixin(H5This!"area");

	/**
	 * Attribute 	Value 	Description
alt 	text 	Specifies an alternate text for the area. Required if the href attribute is present
coords 	coordinates 	Specifies the coordinates of the area
download 	filename 	Specifies that the target will be downloaded when a user clicks on the hyperlink
href 	URL 	Specifies the hyperlink target for the area
hreflang 	language_code 	Specifies the language of the target URL
media 	media query 	Specifies what media/device the target URL is optimized for
nohref 	value 	Not supported in HTML5.
Specifies that an area has no associated link
rel 	alternate
author
bookmark
help
license
next
nofollow
noreferrer
prefetch
prev
search
tag 	Specifies the relationship between the current document and the target URL
shape 	default
rect
circle
poly 	Specifies the shape of the area
target 	_blank
_parent
_self
_top
framename 	Specifies where to open the target URL
type 	media_type 	Specifies the media type of the target URL
*/
}
mixin(H5Short!"Area");

unittest {
	mixin(H5Test!("H5Area", "area"));
}

/**
 *  <img src="planets.gif" width="145" height="126" alt="Planets"
usemap="#planetmap">

<map name="planetmap">
  <area shape="rect" coords="0,0,82,126" href="sun.htm" alt="Sun">
  <area shape="circle" coords="90,58,3" href="mercur.htm" alt="Mercury">
  <area shape="circle" coords="124,58,8" href="venus.htm" alt="Venus">
</map> */

