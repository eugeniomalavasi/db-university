-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`students`.`enrolment_date`) AS `year`, COUNT(`students`.`id`) AS `students_number`
FROM `students` 
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `teachers`.`office_address`, COUNT(`teachers`.`id`) AS `number_of_teachers:`
FROM `teachers`
GROUP BY `teachers`.`office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `degrees`.`name`, AVG(`exam_student`.`vote`) AS average_vote
FROM `exams`
INNER JOIN `exam_student`
ON `exams`.`id` = `exam_student`.`exam_id`
INNER JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
GROUP BY `degrees`.`name`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `departments`.`name` AS `department_name`, COUNT(`degrees`.`id`) AS `degrees_number_per_dep`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`name`;