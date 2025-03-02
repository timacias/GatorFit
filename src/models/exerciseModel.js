// models/exerciseModel.js
const pool = require("../config/db");

// ----- CREATE -----
const createExercise = async (exerciseData) => {
  const { name, category, duration, calories_burned, muscle_group, difficulty, description } = exerciseData;
  const query = `
    INSERT INTO exercises (name, category, duration, calories_burned, muscle_group, difficulty, description)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING *
  `;
  const values = [name, category, duration, calories_burned, muscle_group, difficulty, description];
  const result = await pool.query(query, values);
  return result.rows[0];
};

// ----- READ -----
const getExercises = async (filters = {}) => {
  if (Object.keys(filters).length === 0) {
    const query = `SELECT * FROM exercises`;
    const result = await pool.query(query);
    return result.rows;
  }
  const filterKeys = Object.keys(filters);
  const conditions = filterKeys.map((key, index) => `${key} = $${index + 1}`).join(" AND ");
  const values = Object.values(filters);
  const query = `SELECT * FROM exercises WHERE ${conditions}`;
  const result = await pool.query(query, values);
  return result.rows;
};

const getExerciseById = async (id) => {
  const query = `SELECT * FROM exercises WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

const getExerciseAttributeById = async (id, attribute) => {
  const allowedAttributes = [
    'id', 'name', 'category', 'duration', 'calories_burned',
    'muscle_group', 'difficulty', 'description', 'created_at'
  ];
  if (!allowedAttributes.includes(attribute)) {
    throw new Error("Invalid attribute requested.");
  }
  const query = `SELECT ${attribute} FROM exercises WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0] ? result.rows[0][attribute] : null;
};


// ----- UPDATE -----
const updateExercise = async (id, updates) => {
  const allowedFields = ['name', 'category', 'duration', 'calories_burned', 'muscle_group', 'difficulty', 'description'];
  const updateKeys = Object.keys(updates).filter(key => allowedFields.includes(key));
  if (updateKeys.length === 0) return null;
  const setClause = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(", ");
  const values = updateKeys.map(key => updates[key]);
  const query = `UPDATE exercises SET ${setClause} WHERE id = $${updateKeys.length + 1} RETURNING *`;
  const result = await pool.query(query, [...values, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteExercise = async (id) => {
  const query = `DELETE FROM exercises WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { createExercise, getExercises, getExerciseById, updateExercise, deleteExercise, getExerciseAttributeById };
