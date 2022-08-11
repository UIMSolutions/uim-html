﻿module uim.html.elements.main_;

@safe:
import uim.html;

// Wrapper for <main> - represents the dominant content of the <body> of a document.
class DH5Main : DH5Obj {
	mixin(H5This!("main"));
}
mixin(H5Short!"Main");

version(test_uim_html) { unittest {
    testH5Obj(H5Main, "main");
}}
