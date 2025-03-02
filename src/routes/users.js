// routes/users.js
const express = require("express");
const router = express.Router();
const userModel = require("../models/userModel");

// CREATE a new user
router.post("/", async (req, res) => {
  try {
    const newUser = await userModel.createUser(req.body);
    res.status(201).json(newUser);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create user" });
  }
});

// READ all users (or filter via query parameters)
router.get("/", async (req, res) => {
  try {
    const users = await userModel.getUsers(req.query);
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch users" });
  }
});

// READ a single user by ID
router.get("/:id", async (req, res) => {
  try {
    const user = await userModel.getUserById(req.params.id);
    if (!user) return res.status(404).json({ error: "User not found" });
    res.json(user);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch user" });
  }
});

// UPDATE a user
router.patch("/:id", async (req, res) => {
  try {
    const updatedUser = await userModel.updateUser(req.params.id, req.body);
    if (!updatedUser) return res.status(404).json({ error: "User not found or no valid fields to update" });
    res.json(updatedUser);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update user" });
  }
});

// DELETE a user
router.delete("/:id", async (req, res) => {
  try {
    const deletedUser = await userModel.deleteUser(req.params.id);
    if (!deletedUser) return res.status(404).json({ error: "User not found" });
    res.json(deletedUser);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to delete user" });
  }
});

module.exports = router;
