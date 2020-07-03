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
  writeln(parse(`<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index3.html" class="brand-link">
      <img src="../../dist/img/AdminLTELogo.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../../index.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="../widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Widgets
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Layout Options
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation + Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Boxed</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-topnav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Navbar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-footer.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Footer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/collapsed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Collapsed Sidebar</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Charts
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../charts/chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>ChartJS</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Flot</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/inline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inline</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                UI Elements
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../UI/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/icons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Icons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/buttons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Buttons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/sliders.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sliders</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/modals.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Modals & Alerts</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/navbar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Navbar & Tabs</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/timeline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Timeline</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/ribbons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ribbons</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Forms
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Advanced Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Editors</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/validation.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Validation</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Tables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DataTables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>jsGrid</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">EXAMPLES</li>
          <li class="nav-item">
            <a href="../calendar.html" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Calendar
                <span class="badge badge-info right">2</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="../gallery.html" class="nav-link">
              <i class="nav-icon far fa-image"></i>
              <p>
                Gallery
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Mailbox
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../mailbox/mailbox.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbox</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../mailbox/compose.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Compose</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../mailbox/read-mail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Read</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
                Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../examples/invoice.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Invoice</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/profile.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/e-commerce.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>E-commerce</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/projects.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-add.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Add</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-edit.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Edit</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-detail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Detail</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/contacts.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Extras
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../examples/login.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Login</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/register.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Register</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/forgot-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Forgot Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/recover-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Recover Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/lockscreen.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Lockscreen</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/legacy-user-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Legacy User Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/language-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Language Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/404.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 404</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/500.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 500</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/pace.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pace</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/blank.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Blank Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../starter.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Starter Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">MISCELLANEOUS</li>
          <li class="nav-item">
            <a href="https://adminlte.io/docs/3.0" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>Documentation</p>
            </a>
          </li>
          <li class="nav-header">MULTI LEVEL EXAMPLE</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
                Level 1
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
              <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Level 2
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Blank Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blank Page</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Title</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
          Start creating your amazing application!
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          Footer
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.4
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>`).toH5String);
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


