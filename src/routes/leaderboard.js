// routes/leaderboard.js
const express = require("express");
const router = express.Router();
const leaderboardModel = require("../models/leaderboardModel");

// CREATE a leaderboard record
router.post("/", async (req, res) => {
  try {
    const { user_id, score } = req.body;
    const newRecord = await leaderboardModel.createLeaderboard(user_id, score);
    res.status(201).json(newRecord);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create leaderboard record" });
  }
});

// READ the leaderboard (ranked)
router.get("/", async (req, res) => {
  try {
    const leaderboard = await leaderboardModel.getLeaderboard();
    res.json(leaderboard);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch leaderboard" });
  }
});

// READ a leaderboard record by ID
router.get("/:id", async (req, res) => {
  try {
    const record = await leaderboardModel.getLeaderboardById(req.params.id);
    if (!record) return res.status(404).json({ error: "Leaderboard record not found" });
    res.json(record);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch leaderboard record" });
  }
});

// GET /api/leaderboard/:id/attribute/:attribute - Get a specific attribute of a leaderboard record.
router.get("/:id/attribute/:attribute", async (req, res) => {
  try {
    const { id, attribute } = req.params;
    const value = await leaderboardModel.getLeaderboardAttributeById(id, attribute);
    if (value === null) {
      return res.status(404).json({ error: "Leaderboard record or attribute not found." });
    }
    res.json({ [attribute]: value });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch leaderboard attribute." });
  }
});

// UPDATE a leaderboard record
router.patch("/:id", async (req, res) => {
  try {
    const { score } = req.body;
    const updatedRecord = await leaderboardModel.updateLeaderboard(req.params.id, score);
    if (!updatedRecord) return res.status(404).json({ error: "Leaderboard record not found or no valid update" });
    res.json(updatedRecord);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update leaderboard record" });
  }
});

// DELETE a leaderboard record
router.delete("/:id", async (req, res) => {
  try {
    const deletedRecord = await leaderboardModel.deleteLeaderboard(req.params.id);
    if (!deletedRecord) return res.status(404).json({ error: "Leaderboard record not found" });
    res.json(deletedRecord);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete leaderboard record" });
  }
});

module.exports = router;
