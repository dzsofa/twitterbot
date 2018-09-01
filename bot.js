console.log("The bot is starting");

var Twit = require("twit");

var config = require("./config");

var T = new Twit(config);

// var params = {
//   q: "pizza",
//   count: 10
// };

// function gotData(err, data, response) {
//   var tweets = data.statuses;
//   for (var i = 0; i < tweets.length; i++) {
//     console.log(tweets[i].text);
//     console.log();
//   }
// }

// T.get("search/tweets", params, gotData);

let params = {
  status: "I was tweeted with node.js!"
};

function postData(err, data, response) {
  err
    ? console.log("Yo, there's a problem")
    : console.log("Everything is just fine");
}

T.post("statuses/update", params, postData);
