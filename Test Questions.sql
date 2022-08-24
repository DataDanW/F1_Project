
# How many races have we had so far in 2022?
# Which circuit has the fastest lap time?
# Which driver has scored the most fastest laps points? 
# Which team has had the most DNFs? 
# Which driver has the most pole positions? 


# How many races have we had so far in 2022? - 13
SELECT COUNT(DISTINCT Track) FROM Test.SeasonResults;
SELECT DISTINCT Track FROM Test.SeasonResults;



# Which circuit has the fastest lap time? - Austria 1:07.275
SELECT Track, MIN(FastestLap) FROM Test.SeasonResults
GROUP BY Track
ORDER BY MIN(FastestLap);


# Which driver has scored the most fastest laps points?
-- Max & Charles with 3 each
SELECT Driver, COUNT(Driver), FastestPoint FROM Test.SeasonResults
WHERE FastestPoint = "Yes"
GROUP BY Driver
ORDER BY COUNT(Driver) DESC;

# Which team has had the most DNFs (and DNSs)?
-- Ferrari and Alfa Romeo
SELECT Team,COUNT(TimeRetired) AS DNFs FROM Test.SeasonResults
WHERE TimeRetired = "DNF"
OR TimeRetired = "DNS"
GROUP BY Team
ORDER BY COUNT(TimeRetired) Desc;

# Which driver has the most pole positions? 
-- Charles Leclerc
SELECT Driver, COUNT(StartingGrid) FROM Test.SeasonResults
WHERE StartingGrid = 1
GROUP BY Driver
ORDER BY COUNT(StartingGrid) DESC;


# Ocon vs Alonso: Highest average finishing position?
-- Alonso finished higher on average with 7.54 vs. 7.75 of Ocon 
SELECT AVG(Position), Driver FROM Test.SeasonResults
WHERE Driver = "Esteban Ocon" 
OR Driver = "Fernando Alonso"
GROUP BY Driver;

# Identify the 3 highest race starts for Ferrari's customer teams
-- Haas with P5, Alfa with P5 and Alfa with P6
SELECT Track, Team, StartingGrid FROM Test.SeasonResults
WHERE Team LIKE "% ferrari"
ORDER BY StartingGrid
LIMIT 3;

