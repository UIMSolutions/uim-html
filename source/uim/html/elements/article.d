﻿module uim.html.elements.article;

@safe:
import uim.html;

// represents a self-contained composition in a document, page, application, or site, 
// which is intended to be independently distributable or reusable (e.g., in syndication)
class DH5Article : DH5Obj {
	mixin(H5This!"article");
}
mixin(H5Short!"Article");

version(test_uim_html) { unittest {
	// testH5Obj(H5Article, "article");
}}
