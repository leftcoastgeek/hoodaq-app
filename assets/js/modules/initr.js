
// Do some stuff
window.test = require("user");

// var exports = this;
test.init = function(){
	alert('boom')
}



$(document).ready(function(){ test.init(); })