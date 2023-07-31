-- QUERY CON SELECT:

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM `courses` WHERE `cfu` >= 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM `students` WHERE (2023 - YEAR(`date_of_birth`)) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses` WHERE `year` = 1 AND `period` LIKE 'I %';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE TIME(`hour`) > '14:00' AND DATE(`date`) = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT * FROM `teachers` WHERE `phone` IS NOT NULL;

-- --------------------------------------------------------------------------------------------------------------

-- QUERY CON GROUP BY:

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`enrolment_date`) AS `enrolment_number`, `enrolment_date` FROM `students` GROUP BY `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`office_number`) FROM `teachers` GROUP BY `office_number`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT COUNT(`exam_id`), AVG(`vote`) FROM `exam_student` GROUP BY `exam_id`; 

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`name`) AS `Corso`, `department_id` FROM `degrees` GROUP BY `department_id`;

-- --------------------------------------------------------------------------------------------------------------

-- QUERY CON SELECT:

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`name` AS Nome, S.`surname` AS Cognome FROM `degrees` AS D JOIN `students` AS S ON S.degree_id = D.id WHERE D.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEG.`name` AS Corsi FROM `degrees` AS DEG JOIN `departments` AS DEP ON DEG.`department_id` = DEP.`id` WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT C.name AS 'Corso', t.surname AS 'Insegnante', t.id AS 'ID Insegnante' FROM `teachers` AS T JOIN `course_teacher` AS CT ON CT.teacher_id = T.id JOIN `courses` AS C ON CT.course_id = C.id WHERE T.name = 'Fulvio' AND T.surname = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.name AS 'Nome', S.surname AS 'Cognome', DEG.name AS 'Corso di laurea', DEG.level AS 'Livello', DEP.name AS 'Dipartimento' FROM `students` AS S JOIN `degrees` AS DEG ON S.degree_id = DEG.id JOIN `departments` AS DEP ON DEG.department_id = DEP.id ORDER BY S.name ASC, S.surname ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami