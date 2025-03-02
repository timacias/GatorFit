// models/dailyRoutineModel.js
const pool = require("../config/db");

// ----- CREATE -----
const createDailyRoutine = async (userId, routineDate) => {
  const query = `
    INSERT INTO daily_routines (user_id, routine_date)
    VALUES ($1, $2)
    RETURNING *
  `;
  const result = await pool.query(query, [userId, routineDate]);
  return result.rows[0];
};

// ----- READ -----
const getDailyRoutine = async (userId, routineDate) => {
  const query = `
    SELECT dr.id as routine_id, dr.routine_date, re.exercise_order, re.is_replacement, e.*
    FROM daily_routines dr
    JOIN routine_exercises re ON dr.id = re.daily_routine_id
    JOIN exercises e ON re.exercise_id = e.id
    WHERE dr.user_id = $1 AND dr.routine_date = $2
    ORDER BY re.exercise_order
  `;
  const result = await pool.query(query, [userId, routineDate]);
  return result.rows;
};

const getDailyRoutineById = async (id) => {
  const query = `SELECT * FROM daily_routines WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

// ----- UPDATE -----
const updateDailyRoutine = async (id, updates) => {
  const allowedFields = ['routine_date'];
  const updateKeys = Object.keys(updates).filter(key => allowedFields.includes(key));
  if (updateKeys.length === 0) return null;
  const setClause = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(", ");
  const values = updateKeys.map(key => updates[key]);
  const query = `UPDATE daily_routines SET ${setClause} WHERE id = $${updateKeys.length + 1} RETURNING *`;
  const result = await pool.query(query, [...values, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteDailyRoutine = async (id) => {
  const query = `DELETE FROM daily_routines WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { createDailyRoutine, getDailyRoutine, getDailyRoutineById, updateDailyRoutine, deleteDailyRoutine };
