// models/exerciseModel.js
const pool = require("../config/db");

// ----- CREATE -----
// Insert a new exercise using the columns from the Kaggle dataset.
const createExercise = async (exerciseData) => {
  const {
    exercise_name,
    equipment,
    variation,
    utility,
    mechanics,
    force,
    preparation,
    execution,
    target_muscles,
    synergist_muscles,
    stabilizer_muscles,
    antagonist_muscles,
    dynamic_stabilizer_muscles,
    main_muscle,
    difficulty,
    secondary_muscles,
    parent_id,
  } = exerciseData;
  
  const query = `
    INSERT INTO exercises (
      exercise_name,
      equipment,
      variation,
      utility,
      mechanics,
      force,
      preparation,
      execution,
      target_muscles,
      synergist_muscles,
      stabilizer_muscles,
      antagonist_muscles,
      dynamic_stabilizer_muscles,
      main_muscle,
      difficulty,
      secondary_muscles,
      parent_id
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
    RETURNING *
  `;
  const values = [
    exercise_name,
    equipment,
    variation,
    utility,
    mechanics,
    force,
    preparation,
    execution,
    target_muscles,
    synergist_muscles,
    stabilizer_muscles,
    antagonist_muscles,
    dynamic_stabilizer_muscles,
    main_muscle,
    difficulty,
    secondary_muscles,
    parent_id,
  ];
  
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

// ----- UPDATE -----
const updateExercise = async (id, updates) => {
  const allowedFields = [
    'exercise_name', 'equipment', 'variation', 'utility', 'mechanics', 'force',
    'preparation', 'execution', 'target_muscles', 'synergist_muscles',
    'stabilizer_muscles', 'antagonist_muscles', 'dynamic_stabilizer_muscles',
    'main_muscle', 'difficulty', 'secondary_muscles', 'parent_id'
  ];
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

// ----- GET SPECIFIC ATTRIBUTE -----
// This helper fetches a specific allowed attribute for a given exercise ID.
const getExerciseAttributeById = async (id, attribute) => {
  const allowedAttributes = [
    'id', 'exercise_name', 'equipment', 'variation', 'utility', 'mechanics', 'force',
    'preparation', 'execution', 'target_muscles', 'synergist_muscles', 'stabilizer_muscles',
    'antagonist_muscles', 'dynamic_stabilizer_muscles', 'main_muscle', 'difficulty',
    'secondary_muscles', 'parent_id', 'created_at'
  ];
  if (!allowedAttributes.includes(attribute)) {
    throw new Error("Invalid attribute requested.");
  }
  const query = `SELECT ${attribute} FROM exercises WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0] ? result.rows[0][attribute] : null;
};

module.exports = {
  createExercise,
  getExercises,
  getExerciseById,
  updateExercise,
  deleteExercise,
  getExerciseAttributeById
};
