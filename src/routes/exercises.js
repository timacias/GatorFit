// routes/exercises.js
const express = require("express");
const router = express.Router();
const exerciseModel = require("../models/exerciseModel");

// CREATE a new exercise
router.post("/", async (req, res) => {
  try {
    const newExercise = await exerciseModel.createExercise(req.body);
    res.status(201).json(newExercise);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create exercise" });
  }
});

// READ all exercises
router.get("/", async (req, res) => {
  try {
    const exercises = await exerciseModel.getExercises(req.query);
    res.json(exercises);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch exercises" });
  }
});

// READ a single exercise by ID
router.get("/:id", async (req, res) => {
  try {
    const exercise = await exerciseModel.getExerciseById(req.params.id);
    if (!exercise) return res.status(404).json({ error: "Exercise not found" });
    res.json(exercise);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch exercise" });
  }
});

// UPDATE an exercise
router.patch("/:id", async (req, res) => {
  try {
    const updatedExercise = await exerciseModel.updateExercise(req.params.id, req.body);
    if (!updatedExercise) return res.status(404).json({ error: "Exercise not found or no valid fields to update" });
    res.json(updatedExercise);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update exercise" });
  }
});

// DELETE an exercise
router.delete("/:id", async (req, res) => {
  try {
    const deletedExercise = await exerciseModel.deleteExercise(req.params.id);
    if (!deletedExercise) return res.status(404).json({ error: "Exercise not found" });
    res.json(deletedExercise);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete exercise" });
  }
});

// GET a specific attribute for an exercise by ID
// GET /api/exercises/:id/attribute/:attribute
router.get("/:id/attribute/:attribute", async (req, res) => {
  try {
    const { id, attribute } = req.params;
    const value = await exerciseModel.getExerciseAttributeById(id, attribute);
    if (value === null) {
      return res.status(404).json({ error: "Exercise or attribute not found." });
    }
    res.json({ [attribute]: value });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch exercise attribute." });
  }
});

module.exports = router;

