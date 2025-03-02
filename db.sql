-- Users table: stores login, profile, and nutritional targets.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  fitness_goal VARCHAR(50) NOT NULL,   -- e.g., 'stay_healthy', 'gain_weight', 'lose_weight', 'gain_muscle'
  birthdate DATE,
  currentDate DATE,
  age INT,
  weight DECIMAL,
  height DECIMAL,
  gender VARCHAR(10),
  daily_caloric_goal INT,
  target_protein DECIMAL,              -- daily macro targets
  target_carbs DECIMAL,
  target_fat DECIMAL,
  daily_current_calories INT DEFAULT 0,
  current_protein DECIMAL DEFAULT 0,     -- current consumed macros for the day
  current_carbs DECIMAL DEFAULT 0,
  current_fat DECIMAL DEFAULT 0,
  points INT DEFAULT 0,                  -- for leaderboard ranking
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_caloric_goal() 
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.gender = 'male' THEN
    NEW.daily_caloric_goal := 66 + (13.7 * NEW.weight) + (5 * NEW.height) - (6.8 * NEW.age);
  ELSE
    NEW.daily_caloric_goal := 655 + (9.6 * NEW.weight) + (1.8 * NEW.height) - (4.7 * NEW.age);
  END IF;

  IF NEW.fitness_goal = 'lose_weight' THEN
    NEW.daily_caloric_goal := NEW.daily_caloric_goal * 0.85;
  ELSIF NEW.fitness_goal = 'gain_weight' OR 'gain_muscle' THEN
    NEW.daily_caloric_goal := NEW.daily_caloric_goal * 1.15;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_caloric_goal_trigger
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
WHEN (
  OLD.weight IS DISTINCT FROM NEW.weight OR 
  OLD.height IS DISTINCT FROM NEW.height OR 
  OLD.age IS DISTINCT FROM NEW.age OR 
  OLD.fitness_goal IS DISTINCT FROM NEW.fitness_goal OR 
  OLD.gender IS DISTINCT FROM NEW.gender
)
EXECUTE FUNCTION update_caloric_goal();

CREATE OR REPLACE FUNCTION new_day() 
RETURNS TRIGGER AS $$
BEGIN
    daily_current_calories := 0;
    current_protein := 0; 
    current_carbs := 0;
    current_fat := 0;
    NEW.age := date_part('year', age(NEW.current_date, OLD.birth_date));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER new_day_trigger
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
WHEN (
  OLD.currentDate IS DISTINCT FROM NEW.currentDate
)
EXECUTE FUNCTION new_day();
-- Exercises table: stores publicly available exercise data.
CREATE TABLE exercises (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50),                  -- e.g., Cardio, Strength, Flexibility
  duration INT,                          -- duration in minutes (if applicable)
  calories_burned DECIMAL,               -- estimated calories burned
  muscle_group VARCHAR(50),              -- e.g., chest, back, legs, arms, shoulders, etc.
  difficulty VARCHAR(50),                -- e.g., Beginner, Intermediate, Advanced
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Meals table: logs each meal with detailed nutritional info and optional recipe.
CREATE TABLE meals (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  food VARCHAR(100) NOT NULL,
  recipe TEXT,                           -- text for recipes or preparation details
  calories INT NOT NULL,
  protein DECIMAL,                       -- grams of protein
  carbs DECIMAL,                         -- grams of carbohydrates
  fats DECIMAL,                          -- grams of fats
  meal_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Leaderboard table: stores scores (optional if you already maintain points in users).
CREATE TABLE leaderboard (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  score INT NOT NULL DEFAULT 0
);

-- Daily routines table: one record per user per day.
CREATE TABLE daily_routines (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  routine_type VARCHAR(50) NOT NULL,    
  routine_date DATE NOT NULL,            -- the date for which this routine applies
  completed BOOLEAN DEFAULT false,       -- indicates if the routine was completed
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Routine exercises table: lists the exercises included in a daily routine.
CREATE TABLE routine_exercises (
  id SERIAL PRIMARY KEY,
  daily_routine_id INT REFERENCES daily_routines(id) ON DELETE CASCADE,
  exercise_id INT REFERENCES exercises(id) ON DELETE CASCADE,
  exercise_order INT,                    -- the order in which the exercise should be performed
  is_replacement BOOLEAN DEFAULT false,  -- indicates if this exercise replaced an originally generated one
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
