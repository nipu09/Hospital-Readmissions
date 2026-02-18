Select* from diabetic_data;

-- DATA CLEANING 
-- Removing unwanted coloums

-- removed "weight" coloum
ALTER TABLE diabetic_data
DROP COLUMN weight;

-- removed "payer_code" coloum
ALTER TABLE diabetic_data
DROP COLUMN payer_code;

-- replace '?' with " other" in coloumn   medical_specialty
UPDATE diabetic_data
SET medical_specialty = 'Other'
WHERE medical_specialty = '?';

SELECT distinct medical_specialty 
from diabetic_data;

-- replace '?' with " unknown" in coloumn  race

UPDATE diabetic_data
SET race = 'Unknown'
WHERE race = '?';

-- removing where gender= 'Unknown/Invalid'

DELETE FROM diabetic_data
WHERE gender = 'Unknown/Invalid';

 
select *
from diabetic_data 
where gender = 'Unknown/Invalid';

-- rounds a number to the nearest integer. od diag_1
UPDATE diabetic_data
SET diag_1 = ROUND(diag_1);

-- Create a Age Group Coloumn
ALTER TABLE diabetic_data
ADD Age_group VARCHAR(20);

UPDATE diabetic_data
SET Age_group = 
    CASE 
        WHEN age = '[0-10)' THEN 'children'
        WHEN age = '[10-20)' THEN 'teenage'
        WHEN age IN ('[20-30)', '[30-40)') THEN 'adults'
        WHEN age IN ('[40-50)', '[50-60)') THEN 'middle_age'
        WHEN age IN ('[60-70)', '[70-80)', '[80-90)', '[90-100)') THEN 'seniors'
        ELSE 'Unknown'
    END;
    


-- --------------------------------

-- READMITTED PERCENTAGE OF TARGET DISTRIBUTION

    SELECT 
    readmitted,
    COUNT(*) AS count,
    ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM diabetic_data
GROUP BY readmitted
ORDER BY 
    CASE
        WHEN readmitted = '<30' THEN 1
        WHEN readmitted = '>30' THEN 2
        WHEN readmitted = 'No' THEN 3
    END;

-- PERENTAGE OF AGE GROUP DISTRIBUTIONS

SELECT
	Age_group,
    COUNT(*) AS count,
    ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    GROUP BY Age_group;
   
    
-- PERCENTAGE OF GENDER DISTRIBUTION
    
    SELECT
		gender,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    GROUP BY gender;
    
-- RACE DISTRIBUTION 

        SELECT
		race,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    GROUP BY race;
    
-- LENGHTH OF STAY DISTRIBUTION
    
	SELECT
		time_in_hospital,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    GROUP BY time_in_hospital
    ORDER BY count DESC;
    
-- admission TYPE DISTRIBUTION

     SELECT
		admission_type_id,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    GROUP BY admission_type_id;
    
    -- ---------------------------------------------------------------------
    -- ---------------------------------------------------------------------
    
    
-- READMITTED BY AGE GROUP

    SELECT
		Age_group,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY Age_group;
    
-- READMITTED BY gender

    SELECT
		gender,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY gender;
    
-- READMITTED BY RACE

    SELECT
		race,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY race;
    
-- READMITTED BY ADMISSION TYPE

    SELECT
		admission_type_id,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY admission_type_id;
    
-- READMITTED BY length of stay

    SELECT
		time_in_hospital,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY time_in_hospital
    order by count desc;
    
-- READMITTED BY length of stay

    SELECT
		time_in_hospital,
		COUNT(*) AS count,
		ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
    FROM diabetic_data
    WHERE readmitted = '<30'
    GROUP BY time_in_hospital
    order by count desc;

    
-- READMITTED VS DISCHARGE DISPOSITION
    
SELECT discharge_disposition_id,
COUNT(*) AS count,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30,
ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
FROM diabetic_data
GROUP BY discharge_disposition_id;


-- READMITTED VS NUMBER OF MEDICATION 

SELECT num_medications,
COUNT(*) AS count,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30,
ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
FROM diabetic_data
GROUP BY num_medications;


-- READMITTED VS INSULLINE USAGE

SELECT insulin,
COUNT(*) AS count,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30,
ROUND(100.00 * COUNT(*) / SUM(COUNT(*)) OVER (),2)AS percentage
FROM diabetic_data
GROUP BY insulin;



-- Do more medications increase readmission?

SELECT num_medications,
COUNT(*) total,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30
FROM diabetic_data
GROUP BY num_medications
ORDER BY num_medications;


-- Does number of lab tests matter?

SELECT num_lab_procedures,
COUNT(*) total,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30
FROM diabetic_data
GROUP BY num_lab_procedures
ORDER BY num_lab_procedures;

-- Does number of diagnoses matter?
SELECT number_diagnoses,
COUNT(*) total,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30
FROM diabetic_data
GROUP BY number_diagnoses
ORDER BY number_diagnoses;

-- Who are the highest risk patients?
SELECT 
age,
admission_type_id,
time_in_hospital,
num_medications,
COUNT(*) total,
SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) readmitted_30
FROM diabetic_data
GROUP BY age, admission_type_id, time_in_hospital, num_medications
ORDER BY total DESC;

