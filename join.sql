-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT DISTINCT `students`.`name`, `students`.`surname`,`degrees`.`name`
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
-- NOME CORSO | NOME DIPARTIMENTO | LAUREA MAGISTRALE
SELECT `courses`.`name`, `degrees`.`level`, `departments`.`name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "Magistrale"

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name` as `course_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT DISTINCT `students`.`name`, `students`.`surname`,`departments`.`name` AS `department_name`, `degrees`.`name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
INNER JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`  
ORDER BY `students`.`name`, `students`.`surname` ASC;