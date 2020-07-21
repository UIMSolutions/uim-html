module uim.html.parser;

import uim.html;

struct H5Node {
  string txt;
  bool isRoot = true;
  bool isContent = false;
  bool isStartTag = false;
  bool isEndTag = false;
  string tag;
  int level;
  H5Node[] nodes;

  string id;
  string[] classes;
  string[string] attributes;

  string getIdH5() {
    return `"%s"`.format(id);
  }
  string getClassesH5() {
    string[] results;
    foreach(c; classes) results ~= `"%s"`.format(c);
    return "["~results.join(",")~"]";
  }
  void setAttribute(string att) {
    if (att.strip.indexOf("=") > -1) {
      auto items = att.strip.split("=");
      setAttribute(items[0], items[1].replace(`"`, ""));
    }
    else {
      setAttribute(att, att);
    }
  }
  void setAttribute(string k, string v) {
    writeln("setAttribute(%s, %s)".format(k, v));
    string key = k.toLower; 
    if (key.length == 0) return;

    switch (key) {
      case "id": id = v; break;
      case "class": classes ~= v.split(" "); break;
      default: attributes[key] = (v.indexOf(`"`) > 0 ? v:`"`~v~`"`) ; break; }
    writeln(attributes); }

  void setAttributes(string[string] someAttributes) {
    foreach(k, v; someAttributes) setAttribute(k, v); }

  string getAttributesH5() {
    string[] results;
    foreach(k, v; attributes) if (k.length > 0) results ~= `"%s":%s`.format(k, (v.indexOf(`"`) > -1 ? v:`"`~v~`"`));
    return "["~results.join(",")~"]";
  }

  void setNodes(H5Node[] newNodes) {
    nodes = null;
    auto min = minLevel(newNodes);
    writeln("MinLevel = ", min, " --------------");

    foreach(node; newNodes) {
      writeln("%s - %s ".format(node.level, node).indent(node.level*2));
    }
 
    H5Node levelNode;
    H5Node[] subNodes;
    foreach(node; newNodes) {
      if (node.level == min) {        
        if ((node.isContent) || (node.isStartTag && node.isEndTag)) { // single node
          subNodes = null; 
          nodes ~= node;  
        }
        else if (node.isStartTag) { // start dode 
          subNodes = null; 
          levelNode = node; 
        }
        else if (node.isEndTag) {  // end Node
          levelNode.setNodes(subNodes);
          nodes ~= levelNode;
          subNodes = null;
        }
      }
      else {
        subNodes ~= node;
      }
    }
  }

  DH5Obj[] toH5() {
    if (isRoot) {
        DH5Obj[] results;
      foreach(node; nodes) {
        results ~= node.toH5;
      }
        return results;
    }
    else {
      if (isContent) return [H5String(txt)];
      if (isStartTag && isEndTag) return [H5Obj(attributes).tag(tag).single(true)];
      return [H5Obj(attributes).tag(tag).content(nodes.toH5)];
    }
  }
  string toH5String() {
    if (isRoot) return nodes.toH5String;
    else {
      if (isContent) return `"`~txt~`"`;
      string[] tagContent;
      if (id.length > 0) tagContent ~= getIdH5;
      if (classes.length > 0) tagContent ~= getClassesH5;
      if (attributes.length > 0) tagContent ~= getAttributesH5;
      writeln(tagContent);
      if (isStartTag && isEndTag) return "H5%s(%s)".format(tag.capitalize, tagContent.join(","));
      if (nodes.length > 0) tagContent ~= nodes.toH5String;
      return "H5%s(%s)".format(tag.capitalize, tagContent.join(","));
    }
  }
}
  DH5Obj[] toH5(H5Node[] someNodes) {
    DH5Obj[] results;
    foreach(node; someNodes) results ~= node.toH5;    
    return results;
  }
  auto toH5String(H5Node[] someNodes) {
    string[] results;
    foreach(node; someNodes) results ~= node.toH5String;    
    return results.join(",");
  }

  int minLevel(H5Node[] newNodes) {
    int result;
    if (newNodes.length == 0) return -1;
    result = newNodes[0].level;
    if (newNodes.length == 1) return result;

    foreach(node; newNodes[1..$]) if (node.level < result)  result = node.level;
    return result;
  }

H5Node parse(string html) {
  H5Node rootNode = H5Node(html);
  
  auto level1Items = html.replace("\n", "").split("<")[1..$];  
  foreach(ref item; level1Items) item = "<"~item;

  string[] level2Items;
  foreach(ref item; level1Items) {
    auto items = item.split(">");
    foreach(ref it; items) {
      if (it.strip.length == 0) continue;
      if (it.indexOf("<") > -1) level2Items ~= it~">";
      else level2Items ~= it;
    } 
  }

  H5Node[] newNodes;
  foreach(value; level2Items) {
    H5Node node;
    auto v = value.strip.toLower;
    if (v.indexOf("<") == -1) node.isContent = true;
    else if (v.indexOf("</") > -1) node.isEndTag = true;
    else {
      node.isStartTag = true;
      if (v.indexOf("/>") > -1) node.isEndTag = true;
      if (v.indexOf("< ") > -1) node.isEndTag = true;
      if (v.indexOf("<!doctype") > -1) node.isEndTag = true;
      if (v.indexOf("<img") > -1) node.isEndTag = true;
      if (v.indexOf("<br") > -1) node.isEndTag = true;
      if (v.indexOf("<meta") > -1) node.isEndTag = true;
      if (v.indexOf("<link") > -1) node.isEndTag = true;
    }
    if (node.isStartTag || node.isEndTag || node.isContent) node.isRoot = false;
    node.txt = value;
  
    if (node.isStartTag) {
      // <xxx> -> xxx / <xxx a="b"> -> xxx a="b"
      node.tag = node.txt.strip.replace("<", "").replace(">", "").split(" ")[0];
      // if ()
      auto atts = node.txt.strip.replace("<", "").replace(">", "").split(" ");
      if (atts.length > 1) foreach(a; atts[1..$]) node.setAttribute(a);
    }
    else if (node.isEndTag) node.tag = node.txt.strip.replace("</", "").replace(">", "");

    newNodes ~= node;
  }

  int counter = 0;
  foreach(ref node; newNodes) { 
    if (node.isContent) { node.level = counter; continue; }
    else if ((node.isStartTag) && (node.isEndTag)) { node.level = counter; continue; }
    else if (node.isStartTag) { node.level = counter; counter++; continue; }
    else if (node.isEndTag) { counter--; node.level = counter; continue; }
  }

  rootNode.setNodes(newNodes);
  return rootNode;
}
unittest {
 // writeln(H5Node(`<thead><tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr><tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr></thead>`));
 // writeln(H5Node(`<tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr><tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr>`));
  //writeln(H5Node(`<thead><tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr><tr><th width="1%">Product</th><th>Quantity</th><th>Price</th></tr></thead>`).toH5.toPretty);

}

H5Node parse2(string txt) {
  enum parseMode { readContent, readStart, readEnd, readAttribute, readString }

  H5Node rootNode;
  string[] items;
  string item = "";
  size_t startPos;
  size_t spacePos;   
  size_t endPos;
  size_t equalPos;

  // Step 1: Minimize
  auto html = txt.strip.replace("\n", "");
  while (html.indexOf("  ") > -1) html = html.replace("  ", " ").replace("> </", "></"); 
  debug writeln(html);

  // Step 2: Read indicators
  auto lessIndicators = html.indexOfAll("<");
  writeln("lessIndicators :", lessIndicators);
  auto greaterIndicators = html.indexOfAll(">");
  writeln("greaterIndicators :", greaterIndicators);
  auto spaceIndicators = html.indexOfAll(" ");
  writeln("spaceIndicators :", spaceIndicators);
  auto quoteIndicators = html.indexOfAll(`"`);
  writeln("quoteIndicators :", quoteIndicators);

  // Step 3: Clean wrong Indicators

  // Step 4: Transform in Elements
  size_t lastStart = 0;
  size_t lastEnd = 0;
  foreach(index, pos; lessIndicators) {
    if (index >= lessIndicators.length) items ~= html[lessIndicators[index]..$];
    else {
      if (lastEnd != lessIndicators[index]) {
        auto itemx = html[lastEnd..lessIndicators[index]];        
        if ((itemx != " ") && (itemx.length != 0)) items ~= itemx; 
      }
      items ~= html[lessIndicators[index]..greaterIndicators[index]+1];
    }
    lastStart = lessIndicators[index];
    lastEnd = greaterIndicators[index]+1;
  }

  // Step 4: Set Nodes
  H5Node[] newNodes;
  foreach(value; items) {
    H5Node node;
    auto v = value.strip.toLower;
    if (v.indexOf("</") == 0) node.isEndTag = true;
    else if (v.indexOf("<") == 0) {
      node.isStartTag = true;
      if (v.indexOf("/>") > -1) node.isEndTag = true;
      if (v.indexOf("<!doctype") > -1) node.isEndTag = true;
      if (v.indexOf("<img") > -1) node.isEndTag = true;
      if (v.indexOf("<br") > -1) node.isEndTag = true;
      if (v.indexOf("<meta") > -1) node.isEndTag = true;
      if (v.indexOf("<link") > -1) node.isEndTag = true;
    }
    else node.isContent = true;

    if (node.isStartTag || node.isEndTag || node.isContent) node.isRoot = false;
    node.txt = value;
  
    if (node.isStartTag) {
      // <xxx> -> xxx / <xxx a="b"> -> xxx a="b"
      node.tag = node.txt.strip.replace("<", "").replace(">", "").split(" ")[0];
      // if ()
      auto atts = node.txt.strip.replace("<", "").replace(">", "").split(" ");
      if (atts.length > 1) foreach(a; atts[1..$]) node.setAttribute(a);
    }
    else if (node.isEndTag) node.tag = node.txt.strip.replace("</", "").replace(">", "");
  
    newNodes ~= node;
  }

  int counter = 0;
  foreach(ref node; newNodes) { 
    if (node.isContent) { node.level = counter; continue; }
    else if ((node.isStartTag) && (node.isEndTag)) { node.level = counter; continue; }
    else if (node.isStartTag) { node.level = counter; counter++; continue; }
    else if (node.isEndTag) { counter--; node.level = counter; continue; }
  }

  rootNode.setNodes(newNodes);
  return rootNode;
}
unittest {
  /* writeln(`<tag a d>`);
  writeln(parse2(`<tag a d>`));
  writeln(`<tag a="b" d="c">`);
  writeln(parse2(`<tag a="b" d="c">`));
  writeln(`<tag>`);
  writeln(parse2(`<tag>`));

  writeln(parse2(`
  <nav id="top-navigation" class="well well-sm flex flex-row align-center">
      <a href="#" @click.prevent="isShowingCart = false"><strong>E-commerce Inc.</strong></a>

      <div class="text-right pull-right cart-info">
          <span class="stats">{{ cart.items.length }} <template v-if="cart.items.length == 1">item</template><template v-else>items</template> in cart, totalling {{ cartTotal | currency }}</span>
          <button class="btn btn-primary" @click="isShowingCart = true">View Cart</button>
      </div>
  </nav>`).toH5String);*/ 
}


