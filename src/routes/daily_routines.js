// routes/dailyRoutine.js
const express = require("express");
const router = express.Router();
const dailyRoutineModel = require("../models/dailyRoutineModel");

// For demonstration, assume authentication middleware sets req.user.id.
const authenticate = (req, res, next) => {
  req.user = { id: 1 }; // Replace with real authentication logic.
  next();
};

// CREATE a daily routine
router.post("/", authenticate, async (req, res) => {
  try {
    const { routine_date } = req.body; // expected as 'YYYY-MM-DD'
    const routine = await dailyRoutineModel.createDailyRoutine(req.user.id, routine_date);
    res.status(201).json(routine);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create daily routine" });
  }
});

// READ daily routines for a given date
router.get("/", authenticate, async (req, res) => {
  try {
    const { routine_date } = req.query;
    const routines = await dailyRoutineModel.getDailyRoutine(req.user.id, routine_date);
    res.json(routines);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch daily routine" });
  }
});

// READ a daily routine by ID
router.get("/:id", async (req, res) => {
  try {
    const routine = await dailyRoutineModel.getDailyRoutineById(req.params.id);
    if (!routine) return res.status(404).json({ error: "Daily routine not found" });
    res.json(routine);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch daily routine" });
  }
});

// UPDATE a daily routine
router.patch("/:id", async (req, res) => {
  try {
    const updatedRoutine = await dailyRoutineModel.updateDailyRoutine(req.params.id, req.body);
    if (!updatedRoutine) return res.status(404).json({ error: "Daily routine not found or no valid fields to update" });
    res.json(updatedRoutine);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update daily routine" });
  }
});

// DELETE a daily routine
router.delete("/:id", async (req, res) => {
  try {
    const deletedRoutine = await dailyRoutineModel.deleteDailyRoutine(req.params.id);
    if (!deletedRoutine) return res.status(404).json({ error: "Daily routine not found" });
    res.json(deletedRoutine);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete daily routine" });
  }
});

module.exports = router;
