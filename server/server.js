const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

let queue = [];
let activeMatches = [];

// joining a queue for a client
app.post("/queue", (req, res) => {
  const playerId = req.body.playerId;
  queue.push(playerId);

  if (queue.length >= 2) {
    // match found
    const players = queue.splice(0, 2);

    const match = {
      id: "match_" + Date.now(),
      ip: "123.45.67.89",
      port: 12345,
      players,
    };

    activeMatches.push(match);

    return res.json(match);
  }

  res.json({ status: "waiting" });
});

app.listen(3000, () => console.log("Matchmaking running on port 3000"));
