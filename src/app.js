require("dotenv").config();
const express = require("express");
const cors = require("cors");
const pool = require("./config/db"); // Import database connection
const userRoutes = require("./routes/users"); // Import user routes
const exerciseRoutes = require("./routes/exercises");
const dietRoutes = require("./routes/diet");
const leaderboardRoutes = require("./routes/leaderboard");

const app = express();

// Middleware
app.use(express.json());
app.use(cors());

// Routes
app.use("/api/users", userRoutes);
app.use("/api/exercises", exerciseRoutes);
app.use("/api/diet", dietRoutes);
app.use("/api/leaderboard", leaderboardRoutes);

// Test Route
app.get("/", (req, res) => {
  res.send("API is running!");
});

module.exports = app;
