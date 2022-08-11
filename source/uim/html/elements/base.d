module uim.html.elements.base;

@safe:
import uim.html;

// Wrapper for the base tag - specifies the base URL and/or target for all relative URLs in a document. 
class DH5Base : DH5Obj {
	mixin(H5This!("base"));

  // href = URL - Specifies the base URL for all relative URLs in the page
  mixin(MyAttribute!("href"));   
  unittest{
    assert(H5Base.href("server/folder").href == "server/folder"); 
  }

  mixin(MyAttribute!("target")); // _blank, _parent, _self o. _top - Specifies the default target for all hyperlinks and forms in the page
  unittest{
    assert(H5Base.target("_blank").target == "_blank"); 
  }
}
mixin(H5Short!"Base");

unittest {
  assert(H5Base == "<base></base>");
}
