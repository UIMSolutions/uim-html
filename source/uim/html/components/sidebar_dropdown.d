module uim.html.components.sidebar_dropdown;

@safe:
import uim.html;

class DH5SidebarDropdown : DH5Component {
  this() {
    super();
    css.query
    .rule("body", `font-family: "Lato", sans-serif;`)

    /* Fixed sidenav, full height */
    .rule(".sidenav", `height: 100%; width: 200px; position: fixed; z-index: 1; top: 0; left: 0; background-color: #111; overflow-x: hidden;`~
     `padding-top: 20px;`)

    /* Style the sidenav links and the dropdown button */
    .rule(".sidenav a, .dropdown-btn", `padding: 6px 8px 6px 16px; text-decoration: none; font-size: 20px; color: #818181; display: block;`~
      `border: none; background: none; width: 100%; text-align: left; cursor: pointer; outline: none;`)

    /* On mouse-over */
    .rule(".sidenav a:hover, .dropdown-btn:hover", "color: #f1f1f1;")

    /* Main content */
    .rule(".main", `margin-left: 200px;`~ /* Same as the width of the sidenav */
      `font-size: 20px;`~ /* Increased text to enable scrolling */
      `padding: 0px 10px;`)

    /* Add an active @safe class to the active dropdown button */
    .rule(".active", "background-color: green;color: white;")

    /* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
    .rule(".dropdown-container", `display: none; background-color: #262626; padding-left: 8px;`)

    /* Optional: Style the caret down icon */
    .rule(".fa-caret-down", "float: right;padding-right: 8px;");

    /* Some media queries for responsiveness */
    css
    .query("max450", "screen and (max-height: 450px)")
      .rule(".sidenav", "padding-top: 15px;")
      .rule(".sidenav a", "font-size: 18px;");

        /* }`)
.html(`<d@safe classiv class="sidenav">
  <a href="#about">About</a>
  <a href="#services">Services</a>
  <a href="#clients">Clients</a>
  <a href="#contact">Contact</a>
  <button class="dropdown-btn">Dropdown 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
    <a href="#">Link 2</a>
    <a href="#">Link 3</a>
  </div>
  <a href="#contact">Search</a>
</div>

<div class="main">
  <h2>Sidebar Dropdown</h2>
  <p>Click on the dropdown button to open the dropdown menu inside the side navigation.</p>
  <p>This sidebar is of full height (100%) and always shown.</p>
  <p>Some random text..</p>
</div>`)
.js(`* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
/*var dropdown = document.getElementsBy@safe className("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.@safe classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}`); */
  } 
}
auto H5SidebarDropdown() { return new DH5SidebarDropdown(); }
