module uim.html.h5;

import uim.html;

class DH5 {
    private DH5Obj[] _h5;
    O clear(this O)() {  _h5 = []; return cast(O)this; }

    mixin(H5Element!"a");
    unittest { 
        assert(H5.a == "<a></a>");
    }
    
    mixin(H5Element!"article");
    unittest { 
        assert(H5.article == "<article></article>");
    }
    
    mixin(H5Element!"button");
    unittest { 
        assert(H5.button == "<button></button>");
    }
    
    mixin(H5Element!"canvas");
    unittest { 
        assert(H5.canvas == "<canvas></canvas>");
    }
    
    mixin(H5Element!"div");
    unittest { 
        assert(H5.div == "<div></div>");
    }

    mixin(H5Element!"li");
    unittest { 
        assert(H5.li == "<li></li>");
    }

    mixin(H5Element!"ol");
    unittest { 
        assert(H5.ol == "<ol></ol>");
    }

    mixin(H5Element!"option");
    unittest { 
        assert(H5.option == "<option></option>");
    }

    mixin(H5Element!"section");
    unittest { 
        assert(H5.section == "<section></section>");
    }

    mixin(H5Element!"script");
    unittest { 
        assert(H5.script == "<script></script>");
    }

    mixin(H5Element!"select");
    unittest { 
        assert(H5.script == "<script></script>");
    }

    mixin(H5Element!"span");
    unittest { 
        assert(H5.span == "<span></span>");
    }

    mixin(H5Element!"table");
    unittest { 
        assert(H5.table == "<table></table>");
    }

    mixin(H5Element!"td");
    unittest { 
        assert(H5.td == "<td></td>");
    }

    mixin(H5Element!"th");
    unittest { 
        assert(H5.th == "<th></th>");
    }

    mixin(H5Element!"title");
    unittest { 
        assert(H5.title == "<title></title>");
    }

    mixin(H5Element!"tr");
    unittest { 
        assert(H5.tr == "<tr></tr>");
    }

    mixin(H5Element!"ul");
    unittest { 
        assert(H5.ul == "<ul></ul>");
    }

    mixin(H5Element!"video");
    unittest { 
        assert(H5.video == "<video></video>");
    }

    bool opEqual(string text) { return (text == toString); }
    override string toString() {
        string result;
        foreach(h; _h5) result ~= h.toString;
        return result;
    }
 }    
auto H5() { return new DH5(); }

template H5Element(string name) {		
	const char[] H5Element = "
O "~name.toLower~"(this O)(string content) { _h5 ~=  H5"~name.toLower.capitalize~"(content); return cast(O)this; }
O "~name.toLower~"(this O)(DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[] classes) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[string] attributes) { _h5 ~=  H5"~name.toLower.capitalize~"(id, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[string] attributes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(id, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(id, attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(id, classes, attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[] classes) { _h5 ~=  H5"~name.toLower.capitalize~"(classes); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(classes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[string] attributes) { _h5 ~=  H5"~name.toLower.capitalize~"(attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string[string] attributes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[string] attributes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[] classes, string[string] attributes) { _h5 ~=  H5"~name.toLower.capitalize~"(classes, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string[string] attributes, string content) { _h5 ~=  H5"~name.toLower.capitalize~"(classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)s(string[] classes, string[string] attributes, DH5Obj[] content...) { _h5 ~=  H5"~name.toLower.capitalize~"(classes, attributes, content); return cast(O)this; }

 ";
}