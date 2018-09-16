console.log("The bot is starting");

var Twit = require("twit");

var config = require("./config");

var T = new Twit(config);

var exec = require("child_process").exec;
var fs = require("fs");

var dirArray = ["sketches", "triangles"];

var directory = dirArray[Math.floor(Math.random() * dirArray.length)];

setInterval(tweetMyThing, 1000 * 60 * 120);

function tweetMyThing() {
  var command = directory + "/" + directory;

  exec(command, processing);
}

function processing() {
  var fileName = directory + "/output.png";
  var params = {
    encoding: "base64"
  };
  var b64 = fs.readFileSync(fileName, params);
  T.post("media/upload", { media_data: b64 }, uploaded);
}

function uploaded(err, data, respsonse) {
  var id = data.media_id_string;
  var tweet = {
    status: "#tweetsomesweetprocessing ",
    media_ids: [id]
  };
  T.post("statuses/update", tweet, postData);
}

function postData(err, data, response) {
  if (err) {
    console.log("Yo, there's a problem.");
  } else {
    console.log("Everything's juuust fine.");
  }
}
