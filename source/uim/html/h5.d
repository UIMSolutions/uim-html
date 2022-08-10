module uim.html.h5;

@safe:
import uim.html;

class DH5 {
    this() { _objs = []; }

    protected DH5Obj[] _objs;
    auto objs(this O)() { return _objs; }
    O clear(this O)() {  _objs = []; return cast(O)this; }

    DH5Obj obj(string tag) {
        switch(tag.toLower) {
            case "thead": return H5Thead();
            default: return H5Obj().tag(tag);
        } 
    }

/*
    T opBinary(string op)(DH5Obj[] someElements) {
        static if (op, "~") return _objs~someElements;
        else static assert(0, "Operator "~op~" not implemented");
    }
*/
    mixin(H5Def!"a");
    unittest { 
        version(test_uim_html) {
        assert(H5.a, "<a></a>");
    }}
    
    mixin(H5Def!"abbr");
    version(test_uim_html) {
      unittest { 
        assert(H5.abbr, "<abbr></abbr>");
    }}
    
    mixin(H5Def!"address");
    version(test_uim_html) {
      unittest { 
        assert(H5.address, "<address></address>");
    }}
    
    mixin(H5Def!"area");
    version(test_uim_html) {
      unittest { 
        assert(H5.area, "<area></area>");
    }}
    
    mixin(H5Def!"article");
    version(test_uim_html) {
      unittest { 
        assert(H5.article, "<article></article>");
    }}

    mixin(H5Def!"aside");
    version(test_uim_html) {
      unittest { 
        assert(H5.aside, "<aside></aside>");
    }}
    
    mixin(H5Def!"audio");
    version(test_uim_html) {
      unittest { 
        assert(H5.audio, "<audio></audio>");
    }}
        
    mixin(H5Def!"b");
    version(test_uim_html) {
      unittest { 
        assert(H5.b, "<b></b>");
    }}
    
    mixin(H5Def!"base");
    version(test_uim_html) {
      unittest { 
        assert(H5.base, "<base></base>");
    }}
    
    mixin(H5Def!"bdi");
    version(test_uim_html) {
      unittest { 
        assert(H5.bdi, "<bdi></bdi>");
    }}
    
    mixin(H5Def!"bdo");
    version(test_uim_html) {
      unittest { 
        assert(H5.bdo, "<bdo></bdo>");
    }}
    
    mixin(H5Def!"big");
    version(test_uim_html) {
      unittest { 
        assert(H5.big, "<big></big>");
    }}
    
    mixin(H5Def!"blockquote");
    version(test_uim_html) {
      unittest { 
        assert(H5.blockquote, "<blockquote></blockquote>");
    }}
    
    // mixin(H5Def!"body");
    auto body_(this O)(string content) { _objs ~=  H5Body(content); return cast(O)this; }
    auto body_(this O)(DH5Obj[] content...) { _objs ~=  H5Body(content); return cast(O)this; }
    auto body_(this O)(DH5 content) { _objs ~=  H5Body(content); return cast(O)this; }

    auto body_(this O)(string id, string content) { _objs ~=  H5Body(id, content); return cast(O)this; }
    auto body_(this O)(string id, DH5Obj[] content...) { _objs ~=  H5Body(id, content); return cast(O)this; }
    auto body_(this O)(string id, DH5 content) { _objs ~=  H5Body(id, content); return cast(O)this; }

    auto body_(this O)(string id, string[] classes) { _objs ~=  H5Body(id, classes); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, string content) { _objs ~=  H5Body(id, classes, content); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, DH5Obj[] content...) { _objs ~=  H5Body(id, classes, content); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, DH5 content) { _objs ~=  H5Body(id, classes, content); return cast(O)this; }

    auto body_(this O)(string[] classes) { _objs ~=  H5Body(classes); return cast(O)this; }
    auto body_(this O)(string content) { _objs ~=  H5Body(classes, content); return cast(O)this; }
    auto body_(this O)(string[] classes,string[] classes,  DH5Obj[] content...) { _objs ~=  H5Body(classes, content); return cast(O)this; }
    auto body_(this O)(string[] classes, DH5 content) { _objs ~=  H5Body(classes, content); return cast(O)this; }

    auto body_(this O)(string[string] attributes) { _objs ~=  H5Body(attributes); return cast(O)this; }
    auto body_(this O)(string[string] attributes, string content) { _objs ~=  H5Body(attributes, content); return cast(O)this; }
    auto body_(this O)(string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Body(attributes, content); return cast(O)this; }
    auto body_(this O)(string[string] attributes, DH5 content) { _objs ~=  H5Body(attributes, content); return cast(O)this; }

    auto body_(this O)(string id, string[string] attributes) { _objs ~=  H5Body(id, attributes); return cast(O)this; }
    auto body_(this O)(string id, string[string] attributes, string content) { _objs ~=  H5Body(id, attributes, content); return cast(O)this; }
    auto body_(this O)(string id, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Body(id, attributes, content); return cast(O)this; }
    auto body_(this O)(string id, string[string] attributes, DH5 content) { _objs ~=  H5Body(id, attributes, content); return cast(O)this; }

    auto body_(this O)(string id, string[] classes, string[string] attributes) { _objs ~=  H5Body(id, classes, attributes); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, string[string] attributes, string content) { _objs ~=  H5Body(id, classes, attributes, content); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Body(id, classes, attributes, content); return cast(O)this; }
    auto body_(this O)(string id, string[] classes, string[string] attributes, DH5 content) { _objs ~=  H5Body(id, classes, attributes, content); return cast(O)this; }
    unittest { 
        assert(H5.body_, "<body></body>");
    }
    
    mixin(H5Def!"br");
    version(test_uim_html) {
      unittest { 
        assert(H5.br, "<br>");
    }}
    
    mixin(H5Def!"button");
    version(test_uim_html) {
      unittest { 
        assert(H5.button, "<button></button>");
    }}
    
    mixin(H5Def!"canvas");
    unittest { 
        version(test_uim_html) {
/*	    assert(H5.canvas("test", [""]), `<canvas id="test"></canvas><script>function drawtest(){var canvas=document.getElementById('test');`~
		`var context=canvas.getContext('2d');}window.addEventListener("load",drawtest,true);</script>`);
*/    }}
    
    mixin(H5Def!"caption");
    version(test_uim_html) {
      unittest { 
        assert(H5.caption, "<caption></caption>");
    }}
    
    mixin(H5Def!"cite");
    version(test_uim_html) {
      unittest { 
        assert(H5.cite, "<cite></cite>");
    }}
    
    mixin(H5Def!"code");
    version(test_uim_html) {
      unittest { 
        assert(H5.code, "<code></code>");
    }}
    
    mixin(H5Def!"col");
    version(test_uim_html) {
      unittest { 
        assert(H5.col, "<col></col>");
    }}
    
    mixin(H5Def!"colgroup");
    version(test_uim_html) {
      unittest { 
        assert(H5.colgroup, "<colgroup></colgroup>");
    }}
    
    mixin(H5Def!"content");
    version(test_uim_html) {
      unittest { 
        assert(H5.content, "<content></content>");
    }}
    
    mixin(H5Def!"data");
    version(test_uim_html) {
      unittest { 
        assert(H5.data, "<data></data>");
    }}

    mixin(H5Def!"datalist");
    version(test_uim_html) {
      unittest { 
        assert(H5.datalist, "<datalist></datalist>");
    }}

     mixin(H5Def!"dd");
    version(test_uim_html) {
      unittest { 
        assert(H5.dd, "<dd></dd>");
    }}

    mixin(H5Def!"decorator");
    version(test_uim_html) {
      unittest { 
        assert(H5.decorator, "<decorator></decorator>");
    }}

    mixin(H5Def!"del");
    version(test_uim_html) {
      unittest { 
        assert(H5.del, "<del></del>");
    }}

    mixin(H5Def!"details");
    version(test_uim_html) {
      unittest { 
        assert(H5.details, "<details></details>");
    }}

    mixin(H5Def!"dfn");
    version(test_uim_html) {
      unittest { 
        assert(H5.dfn, "<dfn></dfn>");
    }}

    mixin(H5Def!"dialog");
    version(test_uim_html) {
      unittest { 
        assert(H5.dialog, "<dialog></dialog>");
    }}

    mixin(H5Def!"div");
    unittest { 
        assert(H5.div, "<div></div>");
    }

    mixin(H5Def!"dl");
    unittest { 
        assert(H5.dl, "<dl></dl>");
    }

    mixin(H5Def!"dt");
    unittest { 
        assert(H5.dt, "<dt></dt>");
    }

    mixin(H5Def!"element");
    unittest { 
        assert(H5.element, "<element></element>");
    }

    mixin(H5Def!"em");
    unittest { 
        assert(H5.em, "<em></em>");
    }

    mixin(H5Def!"embed");
    unittest { 
        assert(H5.embed, "<embed></embed>");
    }

    mixin(H5Def!"fieldset");
    unittest { 
        assert(H5.fieldset, "<fieldset></fieldset>");
    }

    mixin(H5Def!"figcaption");
    unittest { 
        assert(H5.figcaption, "<figcaption></figcaption>");
    }

    mixin(H5Def!"figure");
    unittest { 
        assert(H5.figure, "<figure></figure>");
    }

    mixin(H5Def!"footer");
    unittest { 
        assert(H5.footer, "<footer></footer>");
    }

    mixin(H5Def!"form");
    unittest { 
        assert(H5.form, "<form></form>");
    }

    mixin(H5Def!"h1");
    unittest { 
        assert(H5.h1, "<h1></h1>");
    }

    mixin(H5Def!"h2");
    unittest { 
        assert(H5.h2, "<h2></h2>");
    }

    mixin(H5Def!"h3");
    unittest { 
        assert(H5.h3, "<h3></h3>");
    }

    mixin(H5Def!"h4");
    unittest { 
        assert(H5.h4, "<h4></h4>");
    }

    mixin(H5Def!"h5");
    unittest { 
        assert(H5.h5, "<h5></h5>");
    }

    mixin(H5Def!"h6");
    unittest { 
        assert(H5.h6, "<h6></h6>");
    }

    mixin(H5Def!"head");
    unittest { 
        assert(H5.head, "<head></head>");
    }

    mixin(H5Def!"header");
    unittest { 
        assert(H5.header, "<header></header>");
    }

    mixin(H5Def!"hr");
    unittest { 
        assert(H5.hr, "<hr></hr>");
    }

    mixin(H5Def!"html");
    unittest { 
        assert(H5.html, "<!doctype html><html><head></head><body></body></html>");
    }

    mixin(H5Def!"i");
    unittest { 
        assert(H5.i, "<i></i>");
    }

    mixin(H5Def!"iframe");
    unittest { 
        assert(H5.iframe, "<iframe></iframe>");
    }

    mixin(H5Def!"img");
    unittest { 
        assert(H5.img, "<img>");
    }

    mixin(H5Def!"input");
    unittest { 
        assert(H5.input, "<input>");
    }

    mixin(H5Def!"ins");
    unittest { 
        assert(H5.ins, "<ins></ins>");
    }

    mixin(H5Def!"kbd");
    unittest { 
        assert(H5.kbd, "<kbd></kbd>");
    }

    mixin(H5Def!"keygen");
    unittest { 
        assert(H5.keygen, "<keygen></keygen>");
    }

    mixin(H5Def!"label");
    unittest { 
        assert(H5.label, "<label></label>");
    }

    mixin(H5Def!"legend");
    unittest { 
        assert(H5.legend, "<legend></legend>");
    }

    mixin(H5Def!"li");
    unittest { 
        assert(H5.li, "<li></li>");
    }

    mixin(H5Def!"link");
    unittest { 
        assert(H5.link, "<link>");
    }

    mixin(H5Def!"list");
    unittest { 
        assert(H5.list, "<list></list>");
    }

    // mixin(H5Def!"main");
auto main_(this O)(string content) { _objs ~=  H5Main(content); return cast(O)this; }
auto main_(this O)(DH5Obj[] content...) { _objs ~=  H5Main(content); return cast(O)this; }
auto main_(this O)(DH5 content) { _objs ~=  H5Main(content); return cast(O)this; }

auto main_(this O)(string id, string content) { _objs ~=  H5Main(id, content); return cast(O)this; }
auto main_(this O)(string id, DH5Obj[] content...) { _objs ~=  H5Main(id, content); return cast(O)this; }
auto main_(this O)(string id, DH5 content) { _objs ~=  H5Main(id, content); return cast(O)this; }

auto main_(this O)(string id, string[] classes) { _objs ~=  H5Main(id, classes); return cast(O)this; }
auto main_(this O)(string id, string[] classes, string content) { _objs ~=  H5Main(id, classes, content); return cast(O)this; }
auto main_(this O)(string id, string[] classes, DH5Obj[] content...) { _objs ~=  H5Main(id, classes, content); return cast(O)this; }
auto main_(this O)(string id, string[] classes, DH5 content) { _objs ~=  H5Main(id, classes, content); return cast(O)this; }

auto main_(this O)(string[] classes) { _objs ~=  H5Main(classes); return cast(O)this; }
auto main_(this O)(string content) { _objs ~=  H5Main(classes, content); return cast(O)this; }
auto main_(this O)(string[] classes,string[] classes,  DH5Obj[] content...) { _objs ~=  H5Main(classes, content); return cast(O)this; }
auto main_(this O)(string[] classes, DH5 content) { _objs ~=  H5Main(classes, content); return cast(O)this; }

auto main_(this O)(string[string] attributes) { _objs ~=  H5Main(attributes); return cast(O)this; }
auto main_(this O)(string[string] attributes, string content) { _objs ~=  H5Main(attributes, content); return cast(O)this; }
auto main_(this O)(string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Main(attributes, content); return cast(O)this; }
auto main_(this O)(string[string] attributes, DH5 content) { _objs ~=  H5Main(attributes, content); return cast(O)this; }

auto main_(this O)(string id, string[string] attributes) { _objs ~=  H5Main(id, attributes); return cast(O)this; }
auto main_(this O)(string id, string[string] attributes, string content) { _objs ~=  H5Main(id, attributes, content); return cast(O)this; }
auto main_(this O)(string id, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Main(id, attributes, content); return cast(O)this; }
auto main_(this O)(string id, string[string] attributes, DH5 content) { _objs ~=  H5Main(id, attributes, content); return cast(O)this; }

auto main_(this O)(string id, string[] classes, string[string] attributes) { _objs ~=  H5Main(id, classes, attributes); return cast(O)this; }
auto main_(this O)(string id, string[] classes, string[string] attributes, string content) { _objs ~=  H5Main(id, classes, attributes, content); return cast(O)this; }
auto main_(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Main(id, classes, attributes, content); return cast(O)this; }
auto main_(this O)(string id, string[] classes, string[string] attributes, DH5 content) { _objs ~=  H5Main(id, classes, attributes, content); return cast(O)this; }

    unittest { 
        assert(H5.main_, "<main></main>");
    }

    mixin(H5Def!"map");
    unittest { 
        assert(H5.map, "<map></map>");
    }

    mixin(H5Def!"mark");
    unittest { 
        assert(H5.mark, "<mark></mark>");
    }

    mixin(H5Def!"math");
    unittest { 
        assert(H5.math, "<math></math>");
    }

    mixin(H5Def!"menu");
    unittest { 
        assert(H5.menu, "<menu></menu>");
    }

    mixin(H5Def!"menuitem");
    unittest { 
        assert(H5.menuitem, "<menuitem></menuitem>");
    }

    mixin(H5Def!"meta");
    unittest { 
        assert(H5.meta, "<meta>");
    }

    mixin(H5Def!"meter");
    unittest { 
        assert(H5.meter, "<meter></meter>");
    }

    mixin(H5Def!"nav");
    unittest { 
        assert(H5.nav, "<nav></nav>");
    }

    mixin(H5Def!"noscript");
    unittest { 
        assert(H5.noscript, "<noscript></noscript>");
    }

    mixin(H5Def!"object");
    unittest { 
        assert(H5.object, "<object></object>");
    }

    mixin(H5Def!"ol");
    unittest { 
        assert(H5.ol, "<ol></ol>");
    }

    mixin(H5Def!"optgroup");
    unittest { 
        assert(H5.optgroup, "<optgroup></optgroup>");
    }

    mixin(H5Def!"option");
    unittest { 
        assert(H5.option, "<option></option>");
    }

    mixin(H5Def!"output");
    unittest { 
        assert(H5.output, "<output></output>");
    }

    mixin(H5Def!"p");
    unittest { 
        assert(H5.p, "<p></p>");
    }

    mixin(H5Def!"param");
    unittest { 
        assert(H5.param, "<param></param>");
    }

    mixin(H5Def!"picture");
    unittest { 
        assert(H5.picture, "<picture></picture>");
    }

    mixin(H5Def!"pre");
    unittest { 
        assert(H5.pre, "<pre></pre>");
    }

    mixin(H5Def!"progress");
    unittest { 
        assert(H5.progress, "<progress></progress>");
    }

    mixin(H5Def!"q");
    unittest { 
        assert(H5.q, "<q></q>");
    }

    mixin(H5Def!"rbc");
    unittest { 
        assert(H5.rbc, "<rbc></rbc>");
    }

    mixin(H5Def!"rp");
    unittest { 
        assert(H5.rp, "<rp></rp>");
    }

    mixin(H5Def!"rt");
    unittest { 
        assert(H5.rt, "<rt></rt>");
    }

   mixin(H5Def!"rtc");
    unittest { 
        version(test_uim_html) {
          assert(H5.rtc, "<rtc></rtc>");
    }}

    mixin(H5Def!"ruby");
    unittest { 
        version(test_uim_html) {
            //assert(H5.ruby, "<ruby></ruby>");
    }}

    mixin(H5Def!"s");
    unittest { 
        version(test_uim_html) {
            assert(H5.s == "<s></s>");
    }}

    mixin(H5Def!"samp");
    unittest { 
        assert(H5.samp, "<samp></samp>");
    }

    mixin(H5Def!"script");
    unittest { 
        assert(H5.script, "<script></script>");
    }

    mixin(H5Def!"section");
    unittest { 
        assert(H5.section, "<section></section>");
    }

    mixin(H5Def!"select");
    unittest { 
        assert(H5.script, "<script></script>");
    }

    mixin(H5Def!"shadow");
    unittest { 
        assert(H5.shadow, "<shadow></shadow>");
    }

/*     mixin(H5Def!"slot");
    unittest { 
        assert(H5.slot, "<slot></slot>");
    }
 */
    mixin(H5Def!"small");
    unittest { 
        assert(H5.small, "<small></small>");
    }

    mixin(H5Def!"source");
    unittest { 
        assert(H5.source, "<source></source>");
    }

    mixin(H5Def!"span");
    unittest { 
        assert(H5.span, "<span></span>");
    }

    mixin(H5Def!"strong");
    unittest { 
        assert(H5.strong, "<strong></strong>");
    }

    mixin(H5Def!"style");
    unittest { 
        assert(H5.style, "<style></style>");
    }

    mixin(H5Def!"sub");
    unittest { 
        assert(H5.sub, "<sub></sub>");
    }

    mixin(H5Def!"summary");
    unittest { 
        assert(H5.summary, "<summary></summary>");
    }

    mixin(H5Def!"sup");
    unittest { 
        assert(H5.sup, "<sup></sup>");
    }

    mixin(H5Def!"svg");
    unittest { 
        assert(H5.svg, "<svg></svg>");
    }

    mixin(H5Def!"table");
    unittest { 
        assert(H5.table, "<table></table>");
    }

    mixin(H5Def!"tbody");
    unittest { 
        assert(H5.tbody, "<tbody></tbody>");
    }

    mixin(H5Def!"td");
    unittest { 
        assert(H5.td, "<td></td>");
    }

    // mixin(H5Def!"template");
auto template_(this O)(string content) { _objs ~=  H5Template(content); return cast(O)this; }
auto template_(this O)(DH5Obj[] content...) { _objs ~=  H5Template(content); return cast(O)this; }
auto template_(this O)(DH5 content) { _objs ~=  H5Template(content); return cast(O)this; }

auto template_(this O)(string id, string content) { _objs ~=  H5Template(id, content); return cast(O)this; }
auto template_(this O)(string id, DH5Obj[] content...) { _objs ~=  H5Template(id, content); return cast(O)this; }
auto template_(this O)(string id, DH5 content) { _objs ~=  H5Template(id, content); return cast(O)this; }

auto template_(this O)(string id, string[] classes) { _objs ~=  H5Template(id, classes); return cast(O)this; }
auto template_(this O)(string id, string[] classes, string content) { _objs ~=  H5Template(id, classes, content); return cast(O)this; }
auto template_(this O)(string id, string[] classes, DH5Obj[] content...) { _objs ~=  H5Template(id, classes, content); return cast(O)this; }
auto template_(this O)(string id, string[] classes, DH5 content) { _objs ~=  H5Template(id, classes, content); return cast(O)this; }

auto template_(this O)(string[] classes) { _objs ~=  H5Template(classes); return cast(O)this; }
auto template_(this O)(string[] classes, string content) { _objs ~=  H5Template(classes, content); return cast(O)this; }
auto template_(this O)(string[] classes, DH5Obj[] content...) { _objs ~=  H5Template(classes, content); return cast(O)this; }
auto template_(this O)(string[] classes, DH5 content) { _objs ~=  H5Template(classes, content); return cast(O)this; }

auto template_(this O)(string[string] attributes) { _objs ~=  H5Template(attributes); return cast(O)this; }
auto template_(this O)(string[string] attributes, string content) { _objs ~=  H5Template(attributes, content); return cast(O)this; }
auto template_(this O)(string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Template(attributes, content); return cast(O)this; }
auto template_(this O)(string[string] attributes, DH5 content) { _objs ~=  H5Template(attributes, content); return cast(O)this; }

auto template_(this O)(string id, string[string] attributes) { _objs ~=  H5Template(id, attributes); return cast(O)this; }
auto template_(this O)(string id, string[string] attributes, string content) { _objs ~=  H5Template(id, attributes, content); return cast(O)this; }
auto template_(this O)(string id, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Template(id, attributes, content); return cast(O)this; }
auto template_(this O)(string id, string[string] attributes, DH5 content) { _objs ~=  H5Template(id, attributes, content); return cast(O)this; }

auto template_(this O)(string id, string[] classes, string[string] attributes) { _objs ~=  H5Template(id, classes, attributes); return cast(O)this; }
auto template_(this O)(string id, string[] classes, string[string] attributes, string content) { _objs ~=  H5Template(id, classes, attributes, content); return cast(O)this; }
auto template_(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5Template(id, classes, attributes, content); return cast(O)this; }
auto template_(this O)(string id, string[] classes, string[string] attributes, DH5 content) { _objs ~=  H5Template(id, classes, attributes, content); return cast(O)this; }

    unittest { 
        assert(H5.template_, "<template></template>");
    }

    mixin(H5Def!"textarea");
    unittest { 
        assert(H5.textarea, "<textarea></textarea>");
    }

    mixin(H5Def!"tfoot");
    unittest { 
        assert(H5.tfoot, "<tfoot></tfoot>");
    }

    mixin(H5Def!"th");
    unittest { 
        assert(H5.th, "<th></th>");
    }

    mixin(H5Def!"thead");
    unittest { 
        assert(H5.thead, "<thead></thead>");
    }

    mixin(H5Def!"title");
    unittest { 
        assert(H5.title, "<title></title>");
    }

    mixin(H5Def!"tr");
    unittest { 
        assert(H5.tr, "<tr></tr>");
    }

    mixin(H5Def!"track");
    unittest { 
        assert(H5.track, "<track></track>");
    }

    mixin(H5Def!"u");
    unittest { 
        assert(H5.u, "<u></u>");
    }

    mixin(H5Def!"ul");
    unittest { 
        assert(H5.ul, "<ul></ul>");
    }

    mixin(H5Def!"var");
    unittest { 
        assert(H5.var, "<var></var>");
    }

    mixin(H5Def!"video");
    unittest { 
        assert(H5.video, "<video></video>");
    }

    mixin(H5Def!"wbr");
    unittest { 
        assert(H5.wbr, "<wbr></wbr>");
    }

    bool opEquals(string text) { return (text == toString); }
    override string toString() {
        string result;
        foreach(h; _objs) result ~= h.toString;
        return result;
    }
 }    
auto H5() { return new DH5(); }

template H5Def(string name) {		
	const char[] H5Def = "
O "~name.toLower~"(this O)(string content) { _objs ~=  H5"~name.toLower.capitalize~"(content); return cast(O)this; }
O "~name.toLower~"(this O)(DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(content); return cast(O)this; }
O "~name.toLower~"(this O)(DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string content) { _objs ~=  H5"~name.toLower.capitalize~"(id, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(id, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(id, content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[] classes) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[] classes) { _objs ~=  H5"~name.toLower.capitalize~"(classes); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(classes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(classes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[string] attributes) { _objs ~=  H5"~name.toLower.capitalize~"(attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string[string] attributes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[string] attributes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[string] attributes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[string] attributes) { _objs ~=  H5"~name.toLower.capitalize~"(id, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[string] attributes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(id, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(id, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[string] attributes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(id, attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string id, string[] classes, string[string] attributes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(id, classes, attributes, content); return cast(O)this; }

O "~name.toLower~"(this O)(string[] classes, string[string] attributes) { _objs ~=  H5"~name.toLower.capitalize~"(classes, attributes); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string[string] attributes, string content) { _objs ~=  H5"~name.toLower.capitalize~"(classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string[string] attributes, DH5Obj[] content...) { _objs ~=  H5"~name.toLower.capitalize~"(classes, attributes, content); return cast(O)this; }
O "~name.toLower~"(this O)(string[] classes, string[string] attributes, DH5 content) { _objs ~=  H5"~name.toLower.capitalize~"(classes, attributes, content); return cast(O)this; }
 ";
}