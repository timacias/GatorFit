const express = require("express");
const cors = require("cors");

const userRoutes = require("./src/routes/users");
const exerciseRoutes = require("./src/routes/exercises");
const mealRoutes = require("./src/routes/meals");
const leaderboardRoutes = require("./src/routes/leaderboard");

const app = express();
app.use(express.json());
app.use(cors());

app.use("/api/users", userRoutes);
app.use("/api/exercises", exerciseRoutes);
app.use("/api/meals", mealRoutes);
app.use("/api/leaderboard", leaderboardRoutes);

module.exports = app;
