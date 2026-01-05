-- Table: public.faculty

-- DROP TABLE IF EXISTS public.faculty;

CREATE TABLE IF NOT EXISTS public.faculty
(
    faculty_id integer NOT NULL DEFAULT nextval('faculty_faculty_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.faculty
    OWNER to postgres;


    -- Table: public.groups

-- DROP TABLE IF EXISTS public.groups;

CREATE TABLE IF NOT EXISTS public.groups
(
    groups_id integer NOT NULL DEFAULT nextval('groups_groups_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    faculty_id integer NOT NULL,
    CONSTRAINT groups_pkey PRIMARY KEY (groups_id),
    CONSTRAINT groups_faculty_id_fkey FOREIGN KEY (faculty_id)
        REFERENCES public.faculty (faculty_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.groups
    OWNER to postgres;


    -- Table: public.schedule

-- DROP TABLE IF EXISTS public.schedule;

CREATE TABLE IF NOT EXISTS public.schedule
(
    schedule_id integer NOT NULL DEFAULT nextval('schedule_schedule_id_seq'::regclass),
    group_id integer NOT NULL,
    day integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    room text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id),
    CONSTRAINT schedule_group_id_fkey FOREIGN KEY (group_id)
        REFERENCES public.groups (groups_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedule
    OWNER to postgres;


    -- Table: public.students

-- DROP TABLE IF EXISTS public.students;

CREATE TABLE IF NOT EXISTS public.students
(
    students_id integer NOT NULL DEFAULT nextval('students_students_id_seq'::regclass),
    first_name text COLLATE pg_catalog."default" NOT NULL,
    last_name text COLLATE pg_catalog."default" NOT NULL,
    gender "char" NOT NULL,
    birth_date date NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT students_pkey PRIMARY KEY (students_id),
    CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id)
        REFERENCES public.groups (groups_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.students
    OWNER to postgres;