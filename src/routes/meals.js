// routes/meals.js
const express = require("express");
const router = express.Router();
const mealModel = require("../models/mealModel");

// CREATE a new meal
router.post("/", async (req, res) => {
  try {
    const newMeal = await mealModel.createMeal(req.body);
    res.status(201).json(newMeal);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create meal" });
  }
});

// READ meals
router.get("/", async (req, res) => {
  try {
    const meals = await mealModel.getMeals(req.query);
    res.json(meals);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch meals" });
  }
});

// READ a meal by ID
router.get("/:id", async (req, res) => {
  try {
    const meal = await mealModel.getMealById(req.params.id);
    if (!meal) return res.status(404).json({ error: "Meal not found" });
    res.json(meal);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch meal" });
  }
});

// GET /api/meals/:id/attribute/:attribute - Get a specific attribute of a meal.
router.get("/:id/attribute/:attribute", async (req, res) => {
  try {
    const { id, attribute } = req.params;
    const value = await mealModel.getMealAttributeById(id, attribute);
    if (value === null) {
      return res.status(404).json({ error: "Meal or attribute not found." });
    }
    res.json({ [attribute]: value });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch meal attribute." });
  }
});

// UPDATE a meal
router.patch("/:id", async (req, res) => {
  try {
    const updatedMeal = await mealModel.updateMeal(req.params.id, req.body);
    if (!updatedMeal) return res.status(404).json({ error: "Meal not found or no valid fields to update" });
    res.json(updatedMeal);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update meal" });
  }
});

// DELETE a meal
router.delete("/:id", async (req, res) => {
  try {
    const deletedMeal = await mealModel.deleteMeal(req.params.id);
    if (!deletedMeal) return res.status(404).json({ error: "Meal not found" });
    res.json(deletedMeal);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete meal" });
  }
});

module.exports = router;
