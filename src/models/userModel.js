// models/userModel.js
const pool = require("../config/db");

// ----- CREATE -----
// Automatically, SERIAL assigns a unique ID.
const createUser = async (userData) => {
  const { username, email, password, fitness_goal, age, weight, height, gender, daily_caloric_goal, target_protein, target_carbs, target_fat } = userData;
  const query = `
    INSERT INTO users (username, email, password, fitness_goal, age, weight, height, gender, daily_caloric_goal, target_protein, target_carbs, target_fat)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
    RETURNING *
  `;
  const values = [username, email, password, fitness_goal, age, weight, height, gender, daily_caloric_goal, target_protein, target_carbs, target_fat];
  const result = await pool.query(query, values);
  return result.rows[0];
};

// ----- READ -----
const getUsers = async (filters = {}) => {
  if (Object.keys(filters).length === 0) {
    const query = `SELECT * FROM users`;
    const result = await pool.query(query);
    return result.rows;
  }
  const filterKeys = Object.keys(filters);
  const conditions = filterKeys.map((key, index) => `${key} = $${index + 1}`).join(" AND ");
  const values = Object.values(filters);
  const query = `SELECT * FROM users WHERE ${conditions}`;
  const result = await pool.query(query, values);
  return result.rows;
};

const getUserById = async (id) => {
  const query = `SELECT * FROM users WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

// ----- UPDATE -----
const updateUser = async (id, updates) => {
  // Define allowed fields to update.
  const allowedFields = ['username','email','fitness_goal','age','weight','height','gender','daily_caloric_goal','daily_current_calories','target_protein','target_carbs','target_fat','current_protein','current_carbs','current_fat','points'];
  const updateKeys = Object.keys(updates).filter(key => allowedFields.includes(key));
  if (updateKeys.length === 0) return null;
  const setClause = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(", ");
  const values = updateKeys.map(key => updates[key]);
  const query = `UPDATE users SET ${setClause} WHERE id = $${updateKeys.length + 1} RETURNING *`;
  const result = await pool.query(query, [...values, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteUser = async (id) => {
  const query = `DELETE FROM users WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { createUser, getUsers, getUserById, updateUser, deleteUser };
