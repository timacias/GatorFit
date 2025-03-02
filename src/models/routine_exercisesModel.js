// models/routineExerciseModel.js
const pool = require("../config/db");

// ----- CREATE -----
const addExerciseToRoutine = async (dailyRoutineId, exerciseId, exerciseOrder, isReplacement = false) => {
  const query = `
    INSERT INTO routine_exercises (daily_routine_id, exercise_id, exercise_order, is_replacement)
    VALUES ($1, $2, $3, $4)
    RETURNING *
  `;
  const result = await pool.query(query, [dailyRoutineId, exerciseId, exerciseOrder, isReplacement]);
  return result.rows[0];
};

// ----- READ -----
const getRoutineExerciseById = async (id) => {
  const query = `SELECT * FROM routine_exercises WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

const getRoutineExercisesByRoutineId = async (dailyRoutineId) => {
  const query = `SELECT * FROM routine_exercises WHERE daily_routine_id = $1 ORDER BY exercise_order`;
  const result = await pool.query(query, [dailyRoutineId]);
  return result.rows;
};

const getRoutineExerciseAttributeById = async (id, attribute) => {
  const allowedAttributes = ['id', 'daily_routine_id', 'exercise_id', 'exercise_order', 'is_replacement', 'created_at'];
  if (!allowedAttributes.includes(attribute)) {
    throw new Error("Invalid attribute requested.");
  }
  const query = `SELECT ${attribute} FROM routine_exercises WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0] ? result.rows[0][attribute] : null;
};

// ----- UPDATE -----
const updateRoutineExercise = async (id, updates) => {
  const allowedFields = ['exercise_order', 'is_replacement'];
  const updateKeys = Object.keys(updates).filter(key => allowedFields.includes(key));
  if (updateKeys.length === 0) return null;
  const setClause = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(", ");
  const values = updateKeys.map(key => updates[key]);
  const query = `UPDATE routine_exercises SET ${setClause} WHERE id = $${updateKeys.length + 1} RETURNING *`;
  const result = await pool.query(query, [...values, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteRoutineExercise = async (id) => {
  const query = `DELETE FROM routine_exercises WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { addExerciseToRoutine, getRoutineExerciseById, getRoutineExercisesByRoutineId, updateRoutineExercise, deleteRoutineExercise, getRoutineExerciseAttributeById };
