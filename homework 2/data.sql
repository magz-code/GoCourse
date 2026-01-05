INSERT INTO public.faculty (faculty_id, name) VALUES
(1, 'Humanities'),
(2, 'Engineering');


INSERT INTO public.groups (groups_id, name, faculty_id) VALUES
(1, 'ENG-101', 2),
(2, 'ENG-102', 2),
(3, 'HUM-201', 1),
(4, 'HUM-202', 1),
(5, 'HUM-203', 1);


INSERT INTO public.students
(students_id, first_name, last_name, gender, birth_date, group_id) VALUES
(1, 'Magzhan', 'Altyn', 'M', '2006-01-24', 1),
(2, 'Aisha',   'Elman', 'F', '2004-03-12', 2),
(3, 'Ayau',    'Alman', 'F', '2005-04-07', 2);


INSERT INTO public.schedule
(schedule_id, group_id, day, start_time, end_time, room) VALUES
(1, 1, 1, '11:00', '11:50', '5e.101'),
(2, 2, 4, '12:00', '12:50', '7.315');
