// routes/routineExercise.js
const express = require("express");
const router = express.Router();
const routineExerciseModel = require("../models/routineExerciseModel");

// CREATE a routine exercise (i.e. add an exercise to a daily routine)
router.post("/", async (req, res) => {
  try {
    const { daily_routine_id, exercise_id, exercise_order, is_replacement } = req.body;
    const newEntry = await routineExerciseModel.addExerciseToRoutine(daily_routine_id, exercise_id, exercise_order, is_replacement);
    res.status(201).json(newEntry);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to add exercise to routine" });
  }
});

// READ a routine exercise by ID
router.get("/:id", async (req, res) => {
  try {
    const entry = await routineExerciseModel.getRoutineExerciseById(req.params.id);
    if (!entry) return res.status(404).json({ error: "Routine exercise not found" });
    res.json(entry);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch routine exercise" });
  }
});

// READ all routine exercises for a given daily routine
router.get("/routine/:daily_routine_id", async (req, res) => {
  try {
    const entries = await routineExerciseModel.getRoutineExercisesByRoutineId(req.params.daily_routine_id);
    res.json(entries);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch routine exercises" });
  }
});

// UPDATE a routine exercise
router.patch("/:id", async (req, res) => {
  try {
    const updatedEntry = await routineExerciseModel.updateRoutineExercise(req.params.id, req.body);
    if (!updatedEntry) return res.status(404).json({ error: "Routine exercise not found or no valid fields to update" });
    res.json(updatedEntry);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update routine exercise" });
  }
});

// DELETE a routine exercise
router.delete("/:id", async (req, res) => {
  try {
    const deletedEntry = await routineExerciseModel.deleteRoutineExercise(req.params.id);
    if (!deletedEntry) return res.status(404).json({ error: "Routine exercise not found" });
    res.json(deletedEntry);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete routine exercise" });
  }
});

module.exports = router;
