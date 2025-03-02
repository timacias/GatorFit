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
    NEW.daily_caloric_goal := 66 + (6.2376 * NEW.weight) + (12.7 * NEW.height) - (6.8 * NEW.age);
  ELSE
    NEW.daily_caloric_goal := 655 + (4.3379 * NEW.weight) + (4.69 * NEW.height) - (4.7 * NEW.age);
  END IF;

  IF NEW.fitness_goal = 'lose_weight' THEN
    NEW.daily_caloric_goal := NEW.daily_caloric_goal * 0.85;

  ELSE IF NEW.fitness_goal = 'gain_weight' OR 'gain_muscle' THEN
    NEW.daily_caloric_goal := NEW.daily_caloric_goal * 1.15;
  END IF;

  IF NEW.fitness_goal = 'gain_muscle' THEN
    -- For muscle gain, calculate protein as 1.8 grams per kg of body weight.
    weight_kg := NEW.weight * 0.453592;
    NEW.target_protein := ROUND(weight_kg * 1.8);
    
    -- Calculate remaining calories after protein.
    -- Calories from protein = target_protein * 4
    remaining_calories := NEW.daily_caloric_goal - (NEW.target_protein * 4);
    
    -- Distribute remaining calories evenly (50% carbs, 50% fat).
    NEW.target_carbs := ROUND((remaining_calories * 0.50) / 4);
    NEW.target_fat   := ROUND((remaining_calories * 0.50) / 9);
    
  ELSE
    -- For other goals, use a default distribution of 30% protein, 40% carbs, 30% fat.
    NEW.target_protein := ROUND((NEW.daily_caloric_goal * 0.30) / 4);
    NEW.target_carbs   := ROUND((NEW.daily_caloric_goal * 0.40) / 4);
    NEW.target_fat     := ROUND((NEW.daily_caloric_goal * 0.30) / 9);
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
    exercise_name VARCHAR(150) NOT NULL,   -- Mapped from Exercise_Name
    equipment TEXT,                          -- Equipment used
    variation TEXT,                          -- Variation of the exercise
    utility TEXT,                            -- Utility (e.g., training focus)
    mechanics TEXT,                          -- Type of mechanics (e.g., compound, isolation)
    force TEXT,                              -- Force type (e.g., push, pull)
    preparation TEXT,                        -- Preparation details
    execution TEXT,                          -- Execution instructions
    target_muscles TEXT,                     -- Targeted muscles (could be a comma-separated list)
    synergist_muscles TEXT,                  -- Synergist muscles
    stabilizer_muscles TEXT,                 -- Stabilizer muscles
    antagonist_muscles TEXT,                 -- Antagonist muscles
    dynamic_stabilizer_muscles TEXT,         -- Dynamic stabilizer muscles
    main_muscle TEXT,                        -- Main muscle worked
    difficulty INT CHECK (difficulty BETWEEN 1 AND 5),  -- Difficulty on a scale of 1-5
    secondary_muscles TEXT,                  -- Secondary muscles (optional)
    parent_id INT,                           -- Self-referencing foreign key (optional)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES exercises(id) ON DELETE SET NULL
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
