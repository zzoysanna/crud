--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-06 22:14:26 +03

--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;
--
--SET default_tablespace = '';
--
--SET default_table_access_method = heap;

CREATE database nodegmp;


CREATE TABLE IF NOT EXISTS public.users (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    age integer NOT NULL
);

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS public.groups (
    id uuid NOT NULL,
    name text NOT NULL,
    permissions text[] NOT NULL
);

ALTER TABLE public.groups OWNER TO postgres;

CREATE TABLE IF NOT EXISTS public.user_groups (
    "UserModelId" integer NOT NULL,
    "GroupModelId" uuid NOT NULL
);

ALTER TABLE public.user_groups OWNER TO postgres;
ALTER TABLE public.users OWNER TO postgres;

--INSERT INTO public.groups (id, name, permissions) VALUES
--('9e9798f3-99b2-4352-b149-f6d0deec400e', 'manager',	ARRAY ['READ','WRITE']),
--('36e5b356-abe2-46ad-9b13-37a97b2b7f13', 'superuser', ARRAY ['READ','WRITE','DELETE','SHARE','UPLOAD_FILES']);

--INSERT INTO public.user_groups ("UserModelId", "GroupModelId") VALUES
--(2, '9e9798f3-99b2-4352-b149-f6d0deec400e'),
--(3, '9e9798f3-99b2-4352-b149-f6d0deec400e'),
--(4, '9e9798f3-99b2-4352-b149-f6d0deec400e'),
--(5, '9e9798f3-99b2-4352-b149-f6d0deec400e'),
--(8, '36e5b356-abe2-46ad-9b13-37a97b2b7f13'),
--(4, '36e5b356-abe2-46ad-9b13-37a97b2b7f13'),
--(2, '36e5b356-abe2-46ad-9b13-37a97b2b7f13');

--INSERT INTO public.users (id, login, password, age) VALUES
--(DEFAULT, 'zoua', 'strongpassYEEEAH', 90),
--(DEFAULT, 'jsdhfdsf', 'jdhsfjhjsdfh', 20),
--(DEFAULT, 'NickEkk', 'dfgk444m', 26),
--(DEFAULT, 'aaatest', 'dfgk444m', 6),
--(DEFAULT, 'yyytest', 'dfgk444m', 6),
--(DEFAULT, 'atest', 'coolpass1', 60),
--(DEFAULT, 'ivan', 'ivanov', 10),
--(DEFAULT, 'sergey', 'password', 46),
--(DEFAULT, 'boris', 'password', 45),
--(DEFAULT, 'anytest', 'pass2', 36),
--(DEFAULT, 'Arnold', 'vnkdfjn5544', 80),
--(DEFAULT, 'Nickole', '23124bbbbbb', 30),
--(DEFAULT, 'Zeynep', 'mcvxnn4545b', 35);

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey2 PRIMARY KEY ("UserModelId", "GroupModelId");

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT "user_groups_GroupModelId_fkey1" FOREIGN KEY ("GroupModelId") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT "user_groups_UserModelId_fkey1" FOREIGN KEY ("UserModelId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


