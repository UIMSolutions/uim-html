module uim.html.tests;

import uim.html;

void testH5Obj(DH5Obj obj, string tag, bool single) {
  assert(obj, tag~" object is null");
  assert(obj == (single ? `<%s>`.format(tag) : `<%s></%s>`.format(tag, tag)), tag~" has work base string");
}

/* 	// Global HTML attributes	
	O accesskey(this O)(string value) { if (value.length > 0) attributes["accesskey"] = value; return cast(O)this; }
	O contenteditable(this O)(bool value) { if (value) attributes["contenteditable"] = "true"; return cast(O)this; }
	O contextmenu(this O)(string value) { if (value.length > 0) attributes["contextmenu"] = value; return cast(O)this; }
	O dir(this O)(string value) { if (value.length > 0) attributes["dir"] = value; return cast(O)this; }
	O draggable(this O)(bool value) { if (value) attributes["draggable"] = "true"; return cast(O)this; }
	O dropzone(this O)(string value) { if (value.length > 0) attributes["dropzone"] = value; return cast(O)this; }
	O hidden(this O)(bool value) { if (value) attributes["hidden"] = "true"; return cast(O)this; }
	O lang(this O)(string value) { if (value.length > 0) attributes["lang"] = value; return cast(O)this; }
	O spellcheck(this O)(bool value) { if (value) attributes["spellcheck"] = "true"; return cast(O)this; }
	O style(this O)(string value) { if (value.length > 0) attributes["style"] = value; return cast(O)this; }
	O tabindex(this O)(string value) { if (value.length > 0) attributes["tabindex"] = value; return cast(O)this; }
	O title(this O)(string value) { if (value.length > 0) attributes["title"] = value; return cast(O)this; }
	O translate(this O)(bool value) { if (value) attributes["translate"] = "true"; return cast(O)this; } */