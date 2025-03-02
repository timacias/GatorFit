// models/leaderboardModel.js
const pool = require("../config/db");

// ----- CREATE -----
const createLeaderboard = async (user_id, score = 0) => {
  const query = `INSERT INTO leaderboard (user_id, score) VALUES ($1, $2) RETURNING *`;
  const result = await pool.query(query, [user_id, score]);
  return result.rows[0];
};

// ----- READ -----
const getLeaderboard = async () => {
  const query = `
    SELECT username, score
    FROM leaderboard JOIN users ON leaderboard.user_id = users.id
    ORDER BY score DESC
  `;
  const result = await pool.query(query);
  return result.rows;
};

const getLeaderboardById = async (id) => {
  const query = `SELECT * FROM leaderboard WHERE id = $1`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

// ----- UPDATE -----
const updateLeaderboard = async (id, newScore) => {
  const query = `UPDATE leaderboard SET score = $1 WHERE id = $2 RETURNING *`;
  const result = await pool.query(query, [newScore, id]);
  return result.rows[0];
};

// ----- DELETE -----
const deleteLeaderboard = async (id) => {
  const query = `DELETE FROM leaderboard WHERE id = $1 RETURNING *`;
  const result = await pool.query(query, [id]);
  return result.rows[0];
};

module.exports = { createLeaderboard, getLeaderboard, getLeaderboardById, updateLeaderboard, deleteLeaderboard };
