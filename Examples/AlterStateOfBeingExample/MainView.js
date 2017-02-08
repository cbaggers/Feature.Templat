var Observable = require("FuseJS/Observable");
var SuchAService = require("SuchAService");

var aaaThing = Observable("4242424242424242");
var bbbThing = Observable("12");

var info = Observable("");

var testService = function() {
	console.log("requestSuchBar");

	var ohManOhManPARAMS = {
		"aaa": aaaThing.value,
		"bbb": bbbThing.value
	};

    SuchAService.requestSuchBar(ohManOhManPARAMS).then(function(token) {
		var json_info = JSON.stringify(token);
		info.value = json_info;
        console.log("testService worked!\n" + json_info);
    }).catch(function(e) {
        console.log("testService failed:" + e);
		info.value = "Creating Token Failed:\n" + e;
    });
};

module.exports = {
    testService: testService,
	info: info,
	aaaThing: aaaThing,
	bbbThing: bbbThing
};
