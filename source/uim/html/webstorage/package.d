module uim.html.webstorage;
@safe:
import uim.html;

public import uim.html.webstorage.local;
public import uim.html.webstorage.session;


string h5LocalStorageSetItem(string name, string data) {
  return "localStorage.setItem(%s, %s);".format(name, data);
}
unittest {
  assert(h5LocalStorageSetItem("'test'", "values")  == "localStorage.setItem('test', values);");
}

string h5LocalStorageGetItem(string target, string name) {
  return "%s=localStorage.getItem(%s);".format(target, name);
}
unittest {
  assert(h5LocalStorageGetItem("var test", "'test'")  == "var test=localStorage.getItem('test');");
}

string h5LocalStorageRemoveItem(string name) {
  return "localStorage.removeItem(%s);".format(name);
}
unittest {
  assert(h5LocalStorageGetItem("var test", "'test'")  == "var test=localStorage.getItem('test');");
}

/*
HTML web storage provides two objects for storing data on the client:
•window.localStorage - stores data with no expiration date
•window.sessionStorage - stores data for one session (data is lost when the browser tab is closed)

Before using web storage, check browser support for localStorage and sessionStorage:


if (typeof(Storage) !== "undefined") {
   // Code for localStorage/sessionStorage.
  }  else {
   // Sorry! No Web Storage support..
  }
  */

  /*

  <!DOCTYPE html>
<html>
<body>

<div id="result"></div>

<script>
// Check browser support
if (typeof(Storage) !== "undefined") {
  // Store
  localStorage.setItem("lastname", "Smith");
  // Retrieve
  document.getElementById("result").innerHTML = localStorage.getItem("lastname");
} else {
  document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
}
</script>

</body>
</html>

*/

/*
function clickCounter() {
  if (typeof(Storage) !== "undefined") {
    if (sessionStorage.clickcount) {
      sessionStorage.clickcount = Number(sessionStorage.clickcount)+1;
    } else {
      sessionStorage.clickcount = 1;
    }
    document.getElementById("result").innerHTML = "You have clicked the button " + sessionStorage.clickcount + " time(s) in this session.";
  } else {
    document.getElementById("result").innerHTML = "Sorry, your browser does not support web storage...";
  }
}
</script>
</head>
<body>

<p><button onclick="clickCounter()" type="button">Click me!</button></p>
<div id="result"></div>
<p>Click the button to see the counter increase.</p>
<p>Close the browser tab (or window), and try again, and the counter is reset.</p>

 */