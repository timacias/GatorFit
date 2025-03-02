// initDb.js
const { exec } = require('child_process');
const path = require('path');
require('dotenv').config();

// This script assumes your .sql file is in the same folder as initDb.js or you adjust the relative path accordingly.
const sqlFilePath = path.resolve(__dirname, 'schema_and_data.sql');

// Build the psql command.
// Note: This command runs on the client side and uses environment variables from your .env file.
const cmd = `psql -U ${process.env.DB_USER} -d ${process.env.DB_NAME} -f ${sqlFilePath}`;

console.log(`Executing: ${cmd}`);

exec(cmd, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing SQL file: ${error.message}`);
    return;
  }
  if (stderr) {
    console.error(`psql stderr: ${stderr}`);
  }
  console.log(`psql stdout: ${stdout}`);
});
