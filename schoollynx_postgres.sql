--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: classgroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classgroups (
    id integer NOT NULL,
    groupname character varying(20) NOT NULL
);


ALTER TABLE public.classgroups OWNER TO postgres;

--
-- Name: classgroups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.classgroups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classgroups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: confirmations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confirmations (
    id integer NOT NULL,
    person_id integer NOT NULL,
    message_id integer NOT NULL,
    confirmed_on timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.confirmations OWNER TO postgres;

--
-- Name: confirmations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.confirmations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.confirmations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    title character varying(50),
    text text NOT NULL,
    sender_id integer NOT NULL,
    classgroup_id integer NOT NULL,
    sent_on timestamp with time zone DEFAULT now()
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    firstname character varying(20),
    lastname character varying(50) NOT NULL,
    isteacher boolean NOT NULL,
    classgroup_id integer
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.persons ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: classgroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.classgroups OVERRIDING SYSTEM VALUE VALUES (1, '4AHITN');
INSERT INTO public.classgroups OVERRIDING SYSTEM VALUE VALUES (2, '4BHITM');
INSERT INTO public.classgroups OVERRIDING SYSTEM VALUE VALUES (3, '5AHITN');
INSERT INTO public.classgroups OVERRIDING SYSTEM VALUE VALUES (5, '5CHITN');
INSERT INTO public.classgroups OVERRIDING SYSTEM VALUE VALUES (4, '5BHITM');


--
-- Data for Name: confirmations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (613, 72, 26, '2023-02-26 11:47:49.0481+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (614, 15, 21, '2023-02-26 11:48:24.858435+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (615, 7, 6, '2023-02-26 11:51:03.640803+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (307, 39, 16, '2023-02-15 09:26:14.685549+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (309, 62, 11, '2023-01-13 22:52:49.167291+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (341, 16, 2, '2023-01-22 18:26:09.606282+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (616, 7, 7, '2023-02-26 11:55:05.269591+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (352, 8, 7, '2023-01-20 07:52:58.871299+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (358, 9, 7, '2023-01-24 09:50:41.990029+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (328, 11, 6, '2023-01-16 22:07:17.367008+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (347, 17, 2, '2023-01-18 22:43:02.194995+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (353, 22, 2, '2023-01-20 13:39:31.590687+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (399, 22, 8, '2023-01-30 04:47:01.400619+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (339, 11, 12, '2023-02-03 19:22:13.73534+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (405, 23, 8, '2023-01-31 20:39:43.701185+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (345, 12, 12, '2023-02-03 03:31:11.529452+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (411, 24, 8, '2023-01-31 09:10:34.852917+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (417, 25, 8, '2023-01-29 14:50:51.785298+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (319, 40, 16, '2023-02-15 13:52:09.412003+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (400, 7, 13, '2023-02-05 09:52:28.686526+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (406, 9, 13, '2023-02-08 14:42:46.123151+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (418, 12, 13, '2023-02-04 08:46:47.302378+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (325, 44, 16, '2023-02-20 17:36:13.815795+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (331, 45, 16, '2023-02-16 02:54:22.731791+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (454, 15, 14, '2023-01-22 05:53:39.67442+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (460, 17, 14, '2023-01-16 08:20:52.580635+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (398, 11, 18, '2023-02-20 10:03:23.611225+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (450, 13, 29, '2023-01-31 05:28:26.422706+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (456, 17, 29, '2023-02-02 00:26:11.509294+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (462, 20, 29, '2023-01-31 02:27:16.345725+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (468, 25, 29, '2023-02-03 22:02:03.706654+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (401, 15, 3, '2023-01-30 22:46:31.846135+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (407, 16, 3, '2023-02-04 09:36:23.330315+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (413, 19, 3, '2023-02-04 02:27:02.644339+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (425, 20, 3, '2023-02-05 04:37:51.704016+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (452, 8, 19, '2023-02-21 23:20:57.625384+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (470, 9, 19, '2023-02-19 21:51:37.139316+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (431, 22, 3, '2023-02-02 18:25:33.882157+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (337, 50, 22, '2023-01-14 07:37:44.141049+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (451, 7, 24, '2023-02-15 10:29:03.176239+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (457, 8, 24, '2023-02-17 09:50:33.715575+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (343, 52, 22, '2023-01-13 05:50:04.565187+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (355, 44, 22, '2023-01-13 18:46:57.488023+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (361, 40, 22, '2023-01-14 01:17:13.578344+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (459, 16, 9, '2023-02-10 17:18:17.379571+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (465, 19, 9, '2023-02-13 02:04:59.65702+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (320, 16, 21, '2023-01-09 16:20:49.90211+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (332, 17, 21, '2023-01-10 14:56:34.082764+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (408, 13, 28, '2023-01-26 21:10:17.982872+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (414, 16, 28, '2023-01-22 15:09:19.121893+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (420, 19, 28, '2023-01-24 03:31:38.628713+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (426, 20, 28, '2023-01-29 02:27:43.420522+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (432, 24, 28, '2023-01-24 18:21:19.21038+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (348, 38, 27, '2023-01-26 02:30:47.629098+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (354, 40, 27, '2023-01-26 19:28:44.295937+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (372, 45, 27, '2023-01-25 03:15:09.770523+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (378, 46, 27, '2023-01-24 08:37:19.90427+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (315, 63, 11, '2023-01-18 07:34:19.663208+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (321, 68, 11, '2023-01-17 12:29:49.601451+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (338, 70, 17, '2023-02-12 19:35:16.284022+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (356, 72, 17, '2023-02-14 09:35:22.289719+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (362, 54, 17, '2023-02-13 00:40:51.80143+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (397, 57, 23, '2023-01-17 17:06:34.227345+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (403, 58, 23, '2023-01-14 10:41:13.757355+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (409, 59, 23, '2023-01-12 06:34:47.587841+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (415, 64, 23, '2023-01-18 02:23:43.788164+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (427, 65, 23, '2023-01-12 05:55:04.33447+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (433, 69, 23, '2023-01-16 09:53:22.752379+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (449, 38, 4, '2023-01-21 04:15:13.620637+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (455, 39, 4, '2023-01-24 23:07:57.384304+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (461, 40, 4, '2023-01-23 16:49:53.874317+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (467, 42, 4, '2023-01-21 14:16:44.012613+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (482, 11, 19, '2023-02-26 04:02:03.74572+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (317, 13, 1, '2023-01-19 22:00:16.388937+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (323, 17, 1, '2023-01-18 23:41:28.794225+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (329, 20, 1, '2023-01-24 21:05:59.169519+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (475, 9, 24, '2023-02-11 05:26:26.6195+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (481, 11, 24, '2023-02-13 19:14:59.721716+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (487, 12, 24, '2023-02-15 10:52:59.892815+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (365, 23, 2, '2023-01-17 00:16:49.423339+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (522, 12, 25, '2023-01-27 03:33:29.724693+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (528, 7, 25, '2023-02-01 22:53:43.527663+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (524, 42, 10, '2023-02-05 23:00:37.30005+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (530, 44, 10, '2023-02-09 06:58:01.55638+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (484, 20, 14, '2023-01-20 14:17:33.426273+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (536, 48, 10, '2023-02-03 00:52:13.832518+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (490, 22, 14, '2023-01-19 13:08:28.695586+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (514, 53, 5, '2023-01-21 01:40:16.413862+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (566, 49, 10, '2023-02-05 03:23:44.613627+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (511, 16, 20, '2023-01-20 22:25:38.799528+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (523, 19, 20, '2023-01-19 17:23:47.349438+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (520, 54, 5, '2023-01-25 17:10:59.836868+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (529, 22, 20, '2023-01-22 03:23:09.280194+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (535, 23, 20, '2023-01-23 06:11:01.732393+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (519, 19, 15, '2023-01-09 18:56:26.168104+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (537, 20, 15, '2023-01-08 14:33:04.976448+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (543, 23, 15, '2023-01-15 17:33:59.627446+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (549, 25, 15, '2023-01-12 23:02:01.884531+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (526, 56, 5, '2023-01-20 21:26:43.59907+01');
INSERT INTO public.confirmations OVERRIDING SYSTEM VALUE VALUES (532, 57, 5, '2023-01-19 15:42:34.573032+01');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (26, 'Announcement of Field Trip', 'Hello Parents and Guardians, I am excited to announce that we will be taking a field trip to Athens next month. This is a great opportunity for your child to learn outside of the classroom and I look forward to this fun adventure. Let me know if you have any questions.', 5, 5, '2023-02-19 12:09:59.767291+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (27, 'Update on Classroom Behavior', 'Hi Parents and Guardians, I wanted to provide an update on our classroom behavior expectations and how your child is meeting them. Overall, I am very pleased with their behavior, but there are a few areas that could use some improvement. Let''s work together to ensure a positive learning environment for everyone.', 4, 4, '2023-01-23 10:41:52.825893+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (28, 'Information on Student Health Services', 'Dear Parents and Guardians, I wanted to share with you some information about the health services available at our school, including vaccinations and health check-ups. If your child needs any medical attention, please don''t hesitate to reach out to me or the school nurse.', 3, 3, '2023-01-21 21:03:45.572763+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (29, 'Reminder of School Policies', 'Hello Parents and Guardians, I wanted to remind you of some important school policies, including respectful communication, non-damaging behavior and punctual appearance. Please make sure to review these policies with your child and let me know if you have any questions.', 2, 2, '2023-01-27 22:19:51.19609+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (25, 'Reminder of Homework Expectations', 'Dear Parents and Guardians, I wanted to remind you of our homework expectations for this year, including doint the homework without help and in particular not copying it. Please make sure your child is completing their homework on time and to the best of their ability.', 1, 1, '2023-01-26 09:59:45.589665+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (12, 'Invitation to Classroom Event', 'Hi Parents and Guardians, I wanted to invite you to our upcoming classroom event, which will take place on March 6 in Hart near Graz. This is a great opportunity to see your child''s work and learn more about what we''ve been doing in class. I hope to see you there.', 1, 1, '2023-01-30 13:57:21.975271+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (20, 'Update on Standardized Testing', 'Dear Parents and Guardians, I wanted to provide an update on our upcoming standardized testing. We will be taking the test on April 1st and April 3rd, and I encourage your child to prepare by playing less computer games and studying more. Let me know if you have any questions.', 2, 2, '2023-01-17 19:53:37.076919+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (22, 'Request for Volunteer Assistance', 'Dear Parents and Guardians, we have some upcoming events and projects that could use your help. If you are interested in volunteering, please let me know and I will provide more information. Thank you in advance for your support.', 4, 4, '2023-01-10 14:28:47.218664+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (23, 'Invitation to Parent-Teacher Association Meeting', 'Hello Parents and Guardians, I wanted to invite you to our upcoming Parent-Teacher Association meeting, which will take place on November 24, starting at 3 pm. This is a great opportunity to get involved in our school community and make a difference. I hope to see you there.', 5, 5, '2023-01-11 02:54:14.034036+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (1, 'Welcome to the New School Year', 'Dear Parents and Guardians, I wanted to take a moment to welcome you and your child to the new school year. I am excited to get to know each of you and look forward to a successful and fulfilling year together. Please don''t hesitate to reach out to me with any questions or concerns.', 2, 2, '2023-01-18 12:46:51.294896+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (6, 'Reminder of Upcoming Test', 'Hi Parents and Guardians, I wanted to remind you that we will be having an important test next week. Please make sure your child is well-prepared and gets plenty of rest the night before. Let me know if you have any questions.', 1, 1, '2023-01-14 14:44:26.858681+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (2, 'Introduction of Classroom Policies', 'Hello Parents and Guardians, I wanted to share with you the classroom policies and expectations that I have for this year. Please take a moment to review them with your child and let me know if you have any questions. Thank you.', 2, 2, '2023-01-16 14:12:31.636339+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (3, 'Invitation to Parent-Teacher Conferences', 'Hi Parents and Guardians, I wanted to remind you that we will be holding parent-teacher conferences next week. This is a great opportunity to discuss your child''s progress and address any concerns you may have. Please let me know if you would like to schedule a time to meet.', 3, 3, '2023-01-28 18:52:41.574675+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (4, 'Request for Classroom Supplies', 'Dear Parents and Guardians, we are running low on some important classroom supplies and I wanted to reach out to see if anyone would be willing to donate any of the following items: flipchart paper, chalk, printing paper, color pencils. Your generosity and support is greatly appreciated.', 4, 4, '2023-01-19 11:39:13.620203+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (5, 'Important School Safety Update', 'Hello Parents and Guardians, I wanted to share with you an important safety update. We will be implementing a new blackout policy in response to recent events. Please take a moment to review the new policy and let me know if you have any questions or concerns.', 5, 5, '2023-01-18 13:06:39.894804+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (7, 'Announcement of Field Trip', 'Dear Parents and Guardians,
I am excited to announce that we will be taking a field trip next month to the company Cloudflight. Please make sure to return the permission slip and payment by end of week. Let me know if you have any questions.', 1, 1, '2023-02-26 08:01:34.492388+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (18, 'Announcement of Classroom Project', 'Hello Parents and Guardians, I am excited to announce that we will be starting a new classroom project next week. We will be collecting money for the casualties of the recent earthquake. I can''t wait to see what your child will create. Let me know if you have any questions.', 1, 1, '2023-02-15 16:19:43.212787+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (24, 'Information on Curriculum Changes', 'Hi Parents and Guardians, I wanted to share with you some changes to our curriculum this year, including network security and cloud technologies. These changes are designed to improve student learning and engagement, and I welcome your feedback on how they are working.', 1, 1, '2023-02-10 01:39:09.108493+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (13, 'Request for Parent Feedback', 'Dear Parents and Guardians, I value your feedback and would like to know your thoughts on how things are going in our class. Please take a moment to complete the attached survey and let me know how we can improve. Thank you.', 1, 1, '2023-02-02 18:13:24.152936+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (14, 'Information on Special Needs Support', 'Hello Parents and Guardians, I wanted to share with you some information about the special needs support available at our school. If your child has a special need, please don''t hesitate to reach out to me or the special needs coordinator for assistance.', 2, 2, '2023-01-15 19:10:22.384138+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (15, 'Reminder of School Calendar', 'Hi Parents and Guardians, I wanted to remind you of some important dates on the school calendar, including sports weeks, theatre performances and parents day. Please make sure to mark these dates on your calendar and let me know if you have any questions.', 3, 3, '2023-01-08 12:34:49.188211+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (8, 'Update on Curriculum', 'Hello Parents and Guardians, I wanted to give you a quick update on our curriculum for this year. We will be focusing on containerization for the next few weeks and I am excited to see what your child can accomplish. Let me know if you have any questions.', 2, 2, '2023-01-26 05:53:41.918691+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (9, 'Request for Parent Volunteers', 'Hi Parents and Guardians, we have a number of upcoming events and activities that could use some additional support from parent volunteers. If you are interested in helping out, please let me know. Your time and energy would be greatly appreciated.', 3, 3, '2023-02-07 03:19:01.522868+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (10, 'Reminder of School Policies', 'Dear Parents and Guardians, I wanted to remind you of some important school policies that we expect all students to follow. Please take a moment to review them with your child and let me know if you have any questions. Thank you.', 4, 4, '2023-02-02 15:10:28.711672+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (11, 'Update on Student Progress', 'Hello Parents and Guardians, I wanted to provide an update on your child''s progress in our class. Overall, I am very pleased with their performance, but there are a few areas that could use some improvement. Let''s work together to ensure your child''s success this year.', 5, 5, '2023-01-13 06:13:48.33962+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (21, 'Reminders for Back-to-School Night', 'Hi Parents and Guardians, I wanted to remind you of our upcoming Back-to-School Night, which will take place on September 8th in the grand hall. Please make sure to bring your child''s schedule and any questions you may have. I look forward to seeing you there.', 3, 3, '2023-01-09 04:56:14.370147+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (16, 'Update on Extracurricular Activities', 'Dear Parents and Guardians, I wanted to provide an update on the extracurricular activities available at our school, including sports, network management, 3D modeling, and many more. Please encourage your child to get involved and let me know if you have any questions.', 4, 4, '2023-02-13 17:42:35.614991+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (17, 'Request for Parent-Teacher Conference Follow-Up', 'Hi Parents and Guardians, I wanted to follow up on our recent parent-teacher conferences and see if there are any additional questions or concerns that you would like to discuss. Please don''t hesitate to reach out to me if you would like to schedule another meeting.', 5, 5, '2023-02-10 12:50:05.922992+01');
INSERT INTO public.messages OVERRIDING SYSTEM VALUE VALUES (19, 'Invitation to Student-Led Conference', 'Hi Parents and Guardians, I wanted to invite you to our upcoming student-led conference, where your child will share their progress and achievements with you. This is a great opportunity for your child to take ownership of their learning and for you to see their growth. Please let me know if you can attend.', 1, 1, '2023-02-19 19:14:28.104971+01');


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (1, 'Sara', 'Brown', true, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (7, 'Avery', 'Lee', false, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (8, 'Isaac', 'Williams', false, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (9, 'Hazel', 'Jones', false, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (11, 'Grace', 'Wilson', false, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (12, 'Jacob', 'Gonzalez', false, 1);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (13, 'Lily', 'Perez', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (15, 'Mia', 'Clark', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (16, 'Noah', 'Walker', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (17, 'Chloe', 'Hall', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (6, 'David', 'Garcia', true, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (2, 'Adam', 'Smith', true, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (3, 'Emily', 'Davis', true, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (4, 'Luke', 'Johnson', true, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (5, 'Sophia', 'Taylor', true, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (19, 'Aria', 'Young', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (20, 'James', 'Hernandez', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (10, 'Ethan', 'Brown', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (14, 'Aiden', 'Robinson', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (18, 'Owen', 'Allen', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (22, 'Emma', 'Wright', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (23, 'Elijah', 'Scott', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (24, 'Aaliyah', 'Green', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (25, 'Mason', 'Baker', false, 2);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (26, 'Elizabeth', 'Nelson', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (28, 'Madison', 'Mitchell', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (30, 'Aubrey', 'Thompson', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (31, 'Benjamin', 'Evans', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (32, 'Sofia', 'Turner', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (34, 'Victoria', 'Morris', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (36, 'Kaylee', 'Reed', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (37, 'Michael', 'Bailey', false, 3);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (38, 'Harper', 'Cooper', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (39, 'Matthew', 'Richardson', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (40, 'Aurora', 'Barnes', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (42, 'Riley', 'Phillips', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (44, 'Natalie', 'Parker', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (45, 'Logan', 'Henderson', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (46, 'Arianna', 'Gray', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (48, 'Isabella', 'Coleman', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (49, 'Gabriel', 'Murphy', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (50, 'Skylar', 'Cook', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (52, 'Genesis', 'Hamilton', false, 4);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (53, 'Joseph', 'Sullivan', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (54, 'Hannah', 'Wallace', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (56, 'Lily', 'Cole', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (57, 'Zachary', 'Harris', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (58, 'Savannah', 'Ward', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (59, 'Samuel', 'Butler', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (60, 'Addison', 'Foster', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (62, 'Ava', 'Bryant', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (63, 'Nathan', 'Alexander', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (64, 'Audrey', 'Harrison', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (65, 'Christopher', 'Gibson', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (66, 'Brooklyn', 'Mendoza', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (68, 'Caroline', 'Vasquez', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (69, 'Wyatt', 'Castillo', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (70, 'Avery', 'Wheeler', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (72, 'Leah', 'Hansen', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (73, 'Owen', 'Fernandez', false, 5);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (21, 'Oliver', 'King', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (27, 'Caleb', 'Carter', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (29, 'Alexander', 'Parker', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (33, 'William', 'Collins', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (35, 'Daniel', 'Peterson', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (41, 'Jackson', 'Gomez', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (43, 'Evan', 'Campbell', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (47, 'Luke', 'Sanders', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (51, 'David', 'Russell', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (55, 'Adrian', 'Davis', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (61, 'Ethan', 'Gonzales', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (67, 'Isaac', 'Henry', false, NULL);
INSERT INTO public.persons OVERRIDING SYSTEM VALUE VALUES (71, 'Nicholas', 'Chavez', false, NULL);


--
-- Name: classgroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classgroups_id_seq', 5, true);


--
-- Name: confirmations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.confirmations_id_seq', 616, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 37, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_id_seq', 73, true);


--
-- Name: classgroups classgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classgroups
    ADD CONSTRAINT classgroups_pkey PRIMARY KEY (id);


--
-- Name: confirmations confirmations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirmations
    ADD CONSTRAINT confirmations_pk PRIMARY KEY (id);


--
-- Name: messages messages_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pk PRIMARY KEY (id);


--
-- Name: persons parents_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT parents_pk PRIMARY KEY (id);


--
-- Name: confirmations confirmations_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirmations
    ADD CONSTRAINT confirmations_fk FOREIGN KEY (message_id) REFERENCES public.messages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: confirmations confirmations_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirmations
    ADD CONSTRAINT confirmations_fk_1 FOREIGN KEY (person_id) REFERENCES public.persons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: persons fk_classgroups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT fk_classgroups FOREIGN KEY (classgroup_id) REFERENCES public.classgroups(id);


--
-- Name: messages fk_classgroups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_classgroups FOREIGN KEY (classgroup_id) REFERENCES public.classgroups(id);


--
-- Name: messages fk_parents_sender; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_parents_sender FOREIGN KEY (sender_id) REFERENCES public.persons(id);


--
-- PostgreSQL database dump complete
--

