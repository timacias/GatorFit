// models/mealModel.js
const pool = require("../config/db");

// ----- CREATE -----
const createMeal = async (mealData) => {
  const { user_id, food, recipe, calories, protein, carbs, fats, meal_time } = mealData;
  const query = `
    INSERT INTO meals (user_id, food, recipe, calories, protein, carbs, fats, meal_time)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING *
  `;
  const values = [user_id, food, recipe, calories, protein, carbs, fats, meal_time];
  const result = await pool.query(query, values);
  return result.rows[0];
};

// ----- READ -----
const getMeals = async (filters = {}) => {
  if (Object.keys(filters).length === 0) {
    const query = `SELECT * FROM meals`;
    const result = await pool.query(query);
    return result.rows;
  }
  const filterKeys = Object.keys(filters);
  const conditions = filterKeys.map((key, index) => `${key} = $${index + 1}`).join(" AND ");
  const values = Object.values(filters);
  const query = `SELECT * FROM meals WHERE ${conditions}`;
  const result = await pool.query(query, values);
  return result.rows;
};

const getMealById = async (id) => {
  const query = `SELECT * FROM meals WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};


// Existing CRUD functions here...

// Get a specific attribute from the meals table by meal ID.
const getMealAttributeById = async (id, attribute) => {
  const allowedAttributes = [
    'id', 'user_id', 'food', 'recipe', 'calories',
    'protein', 'carbs', 'fats', 'meal_time'
  ];
  if (!allowedAttributes.includes(attribute)) {
    throw new Error("Invalid attribute requested.");
  }
  const query = `SELECT ${attribute} FROM meals WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0] ? result.rows[0][attribute] : null;
};



// ----- UPDATE -----
const updateMeal = async (id, updates) => {
  const allowedFields = ['food', 'recipe', 'calories', 'protein', 'carbs', 'fats', 'meal_time'];
  const updateKeys = Object.keys(updates).filter(key => allowedFields.includes(key));
  if (updateKeys.length === 0) return null;
  const setClause = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(", ");
  const values = updateKeys.map(key => updates[key]);
  const query = `UPDATE meals SET ${setClause} WHERE id = $${updateKeys.length + 1} RETURNING *`;
  const result = await pool.query(query, [...values, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteMeal = async (id) => {
  const query = `DELETE FROM meals WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { createMeal, getMeals, getMealById, updateMeal, deleteMeal, getMealAttributeById };
