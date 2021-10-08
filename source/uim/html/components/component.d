module uim.html.components.component;
@safe:
import uim.html;

@safe class DH5Component {
  this() {}

  mixin(XString!("css"));
  mixin(XString!("html"));
  mixin(XString!("js"));

  override string toString() {
    string result;
    if (css.length > 0) result ~= "<style>"~_css~"</style>";
    if (html.length > 0) result ~= html;
    if (js.length > 0) result ~= "<script>"~_js~"</script>";
    return "";
  }
}
auto H5Component() { return new DH5Component(); }

 