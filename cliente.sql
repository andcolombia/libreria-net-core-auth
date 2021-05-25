--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Ubuntu 12.1-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.0

-- Started on 2020-05-29 12:07:09

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

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 17593)
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


--
-- TOC entry 203 (class 1259 OID 17599)
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."AspNetRoleClaims_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 203
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."AspNetRoleClaims_Id_seq" OWNED BY public."AspNetRoleClaims"."Id";


--
-- TOC entry 204 (class 1259 OID 17601)
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetRoles" (
    "Id" text NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


--
-- TOC entry 205 (class 1259 OID 17607)
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


--
-- TOC entry 206 (class 1259 OID 17613)
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."AspNetUserClaims_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 206
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."AspNetUserClaims_Id_seq" OWNED BY public."AspNetUserClaims"."Id";


--
-- TOC entry 207 (class 1259 OID 17615)
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" character varying(128) NOT NULL,
    "ProviderKey" character varying(128) NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 17621)
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17627)
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Value" text
);


--
-- TOC entry 210 (class 1259 OID 17633)
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AspNetUsers" (
    "Id" text NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 17639)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


--
-- TOC entry 2840 (class 2604 OID 17642)
-- Name: AspNetRoleClaims Id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetRoleClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."AspNetRoleClaims_Id_seq"'::regclass);


--
-- TOC entry 2841 (class 2604 OID 17643)
-- Name: AspNetUserClaims Id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."AspNetUserClaims_Id_seq"'::regclass);


--
-- TOC entry 2997 (class 0 OID 17593)
-- Dependencies: 202
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2999 (class 0 OID 17601)
-- Dependencies: 204
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3000 (class 0 OID 17607)
-- Dependencies: 205
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AspNetUserClaims" VALUES (1, 'd982c23e-bdd6-4873-a014-401808c5bb55', 'name', 'angeltocancipa@gmail.com');
INSERT INTO public."AspNetUserClaims" VALUES (2, '45336421-6663-4fd1-bc3e-18d7f04d7172', 'name', 'eca11d49-3826-4900-8a4f-91c04a02dcc6');
INSERT INTO public."AspNetUserClaims" VALUES (3, '2bc1c4b5-fdfd-4cc7-a443-cae81dd95f0d', 'name', '0b35b395-6a2b-41ec-b2b7-0be8f601fb14');
INSERT INTO public."AspNetUserClaims" VALUES (4, 'd5223e5f-5408-48be-b20a-9933dfa37a2f', 'name', 'be2a205f-801a-45d3-a364-1381a80a56e2');
INSERT INTO public."AspNetUserClaims" VALUES (5, '5bbfb9d1-e37b-4c83-9366-8a02029a8f60', 'name', 'fb222a90-1aef-487b-b292-3174860c02ad');
INSERT INTO public."AspNetUserClaims" VALUES (6, 'eda375b9-5e2f-4278-a1f3-a91e48c0b740', 'name', 'fe8d1f3b-86cc-4419-9c7c-15b8b2e4cffa');
INSERT INTO public."AspNetUserClaims" VALUES (7, '16e0503c-1305-46d7-845f-f47a40249040', 'name', 'CC,234234');
INSERT INTO public."AspNetUserClaims" VALUES (8, 'd94da69f-c337-449c-815c-f93df020f129', 'name', 'CC,888');
INSERT INTO public."AspNetUserClaims" VALUES (9, '58c3be14-41fb-4bed-9823-e5b944828957', 'name', 'CC,999');
INSERT INTO public."AspNetUserClaims" VALUES (10, '58c3be14-41fb-4bed-9823-e5b944828957', 'email', 'ABC@CDE.COM');
INSERT INTO public."AspNetUserClaims" VALUES (11, 'c47b95fc-4a48-4bf6-9c5a-5b7af97e6950', 'name', 'CC,80035211');
INSERT INTO public."AspNetUserClaims" VALUES (12, 'c47b95fc-4a48-4bf6-9c5a-5b7af97e6950', 'email', 'ANGELTOCANCIPA@GMAIL.COM');
INSERT INTO public."AspNetUserClaims" VALUES (13, 'a4a23651-9f0c-41b6-b533-f90bd19f4920', 'name', 'CC,80035213');
INSERT INTO public."AspNetUserClaims" VALUES (14, 'a4a23651-9f0c-41b6-b533-f90bd19f4920', 'email', 'ANGEL.TOCANCIPA@AND.GOV.CO');
INSERT INTO public."AspNetUserClaims" VALUES (15, '41d4b149-84e9-49fd-a3fc-980bb1d373cd', 'name', 'angeltocancipa@gmail.com');
INSERT INTO public."AspNetUserClaims" VALUES (16, '41d4b149-84e9-49fd-a3fc-980bb1d373cd', 'email', 'angeltocancipa@gmail.com');


--
-- TOC entry 3002 (class 0 OID 17615)
-- Dependencies: 207
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '609f671f-78a1-4115-85ba-ef084c23a02f', 'OpenIdConnect', 'cdfc0829-aa89-40a3-be01-1025facf0fa4');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'dd966b6b-124b-45d8-90a7-44b10600a1f7', 'oidc', 'd982c23e-bdd6-4873-a014-401808c5bb55');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'c86523ed-ac0d-401a-a013-860eb215a392', 'oidc', '45336421-6663-4fd1-bc3e-18d7f04d7172');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '8e909a49-9c2a-4375-8433-c23d8c621a1f', 'oidc', '2bc1c4b5-fdfd-4cc7-a443-cae81dd95f0d');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'e1ebbe10-bb87-493a-bc9f-24a5b2b2dc7e', 'oidc', 'd5223e5f-5408-48be-b20a-9933dfa37a2f');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '8297ddb8-7d9e-47d9-9210-f9916756bfd4', 'oidc', '5bbfb9d1-e37b-4c83-9366-8a02029a8f60');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'd3047fc2-3e3d-4a13-ad5b-91665b121d2a', 'oidc', 'eda375b9-5e2f-4278-a1f3-a91e48c0b740');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'c83b6635-31d3-4375-bfe3-3c03a8f47db2', 'oidc', '16e0503c-1305-46d7-845f-f47a40249040');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '46803bbc-3413-41b0-bab9-3c81242de2d7', 'oidc', 'd94da69f-c337-449c-815c-f93df020f129');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '03cfb18b-044f-4bbc-8e8b-6ffcb09738ef', 'oidc', '58c3be14-41fb-4bed-9823-e5b944828957');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', 'd5d42889-7982-4991-b8bb-c0337e924446', 'oidc', 'c47b95fc-4a48-4bf6-9c5a-5b7af97e6950');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '0efe3837-0a2c-4877-ada1-019aff2d2e3f', 'oidc', 'a4a23651-9f0c-41b6-b533-f90bd19f4920');
INSERT INTO public."AspNetUserLogins" VALUES ('oidc', '95b567da-6284-493d-8892-a8a5b6353797', 'oidc', '41d4b149-84e9-49fd-a3fc-980bb1d373cd');


--
-- TOC entry 3003 (class 0 OID 17621)
-- Dependencies: 208
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3004 (class 0 OID 17627)
-- Dependencies: 209
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3005 (class 0 OID 17633)
-- Dependencies: 210
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AspNetUsers" VALUES ('cdfc0829-aa89-40a3-be01-1025facf0fa4', 'angeltocancipa@gmail.com', 'ANGELTOCANCIPA@GMAIL.COM', 'angeltocancipa@gmail.com', 'ANGELTOCANCIPA@GMAIL.COM', true, NULL, 'AUV6KCD3ICUQR5QTK47PFYNN7S54QNIY', '8e9aa65c-8603-459e-8f42-1a5cb3b67861', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('d982c23e-bdd6-4873-a014-401808c5bb55', '407e65cd-6314-4ed7-b4d8-a5e2dc7c70ba', '407E65CD-6314-4ED7-B4D8-A5E2DC7C70BA', NULL, NULL, false, NULL, 'EJTXHW7LOYRDLH6FON7XBQJFUS44GMPB', '115ad492-1442-4a1b-9add-4484735fda0a', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('45336421-6663-4fd1-bc3e-18d7f04d7172', '63d6fedb-067a-4a7e-bf9d-52227f672422', '63D6FEDB-067A-4A7E-BF9D-52227F672422', NULL, NULL, false, NULL, 'PEFJ73PDYV3YV4TXHOX5PUVCXG7GYXCQ', 'a8cb44ef-0f1e-4616-9280-f5c371396c43', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('2bc1c4b5-fdfd-4cc7-a443-cae81dd95f0d', '6af181e7-5b3e-414d-932a-ce152d8743cf', '6AF181E7-5B3E-414D-932A-CE152D8743CF', NULL, NULL, false, NULL, 'UDUMS67INXPWG4SICDC6RRUP5NBCWIMA', '19bf5916-e70b-4d75-82a0-c7b0888b85ae', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('d5223e5f-5408-48be-b20a-9933dfa37a2f', 'a1bd631c-da7f-4ddc-a119-881be43e1631', 'A1BD631C-DA7F-4DDC-A119-881BE43E1631', NULL, NULL, false, NULL, 'GINWJCDP6TR6MNC4RJGIXCOATX3RBOGS', 'ed7bb228-101e-408f-9fd6-527c8d2940f0', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('5bbfb9d1-e37b-4c83-9366-8a02029a8f60', 'e7db646d-9be6-4cbf-b24c-724d6bc907dd', 'E7DB646D-9BE6-4CBF-B24C-724D6BC907DD', NULL, NULL, false, NULL, 'H3VFI6S6TIWMM4OKWAT6PIHU2JTK5KBI', '1f66f695-2e6a-4f59-8d33-279a03cea0e4', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('eda375b9-5e2f-4278-a1f3-a91e48c0b740', 'f240a3c8-1563-4baf-9568-9c183cdc3fea', 'F240A3C8-1563-4BAF-9568-9C183CDC3FEA', NULL, NULL, false, NULL, 'FCIYX2Y22QES4R5BZSDHWNVE5SUKZFMG', '3bdbeb07-4852-4790-b4ca-c2b62ca08e76', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('16e0503c-1305-46d7-845f-f47a40249040', '8ed3a874-992c-499e-9d41-bed21ee6b55f', '8ED3A874-992C-499E-9D41-BED21EE6B55F', NULL, NULL, false, NULL, 'IH563BHZTZIE6QYGX23UKSNOFOI4VXA6', '2c45f5e6-5930-4eae-8d15-2dcec5a685aa', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('d94da69f-c337-449c-815c-f93df020f129', '2e938c50-9271-4909-bfb8-4848be838329', '2E938C50-9271-4909-BFB8-4848BE838329', NULL, NULL, false, NULL, 'AAU74WOQVV3XJEWCPUCEJ45IX4VJR3U7', 'ff44ced4-82db-4ca0-a1ea-43380ef1de67', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('58c3be14-41fb-4bed-9823-e5b944828957', 'b7ac2ec8-d4bd-44aa-bd76-2fb501bbcca9', 'B7AC2EC8-D4BD-44AA-BD76-2FB501BBCCA9', NULL, NULL, false, NULL, 'QVEQRLCCGBVZUTSFRT33KLG7KWCBCQPK', '84d15e41-a963-481c-94cd-7c6b6968d84c', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('c47b95fc-4a48-4bf6-9c5a-5b7af97e6950', 'a5bc301f-f144-440a-bdb4-1e821b6cdae3', 'A5BC301F-F144-440A-BDB4-1E821B6CDAE3', NULL, NULL, false, NULL, 'NDWENSDALNIDT5NCZS4ROZZGLRZYJ5JI', '43452327-44c7-4f10-b9ad-16b5222e6bb2', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('a4a23651-9f0c-41b6-b533-f90bd19f4920', '6a6837c1-4d2a-45bf-938e-28ea02ed0f09', '6A6837C1-4D2A-45BF-938E-28EA02ED0F09', NULL, NULL, false, NULL, 'EPJ7S65VESX77AOJM33FL7OU4OYRIEZ2', 'b8bcca9c-e15c-4e40-89e1-62eb32b08caa', NULL, false, false, NULL, true, 0);
INSERT INTO public."AspNetUsers" VALUES ('41d4b149-84e9-49fd-a3fc-980bb1d373cd', '2ecb2d60-30a0-4ff4-8899-293f2f4fb1c3', '2ECB2D60-30A0-4FF4-8899-293F2F4FB1C3', NULL, NULL, false, NULL, 'WSGI4T4ASHBJV7N7EXDFCM6KNEQUPMRW', 'a13f679c-7d17-4eb1-bd72-7a9e6f6f5b0b', NULL, false, false, NULL, true, 0);


--
-- TOC entry 3006 (class 0 OID 17639)
-- Dependencies: 211
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."__EFMigrationsHistory" VALUES ('20190908190112_InitialCreateApplicationContext', '2.2.6-servicing-10079');


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 203
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."AspNetRoleClaims_Id_seq"', 1, false);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 206
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."AspNetUserClaims_Id_seq"', 16, true);


--
-- TOC entry 2844 (class 2606 OID 17645)
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2846 (class 2606 OID 17647)
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- TOC entry 2850 (class 2606 OID 17649)
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 2853 (class 2606 OID 17651)
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- TOC entry 2856 (class 2606 OID 17653)
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 2858 (class 2606 OID 17655)
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- TOC entry 2861 (class 2606 OID 17657)
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- TOC entry 2864 (class 2606 OID 17659)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 2859 (class 1259 OID 17660)
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EmailIndex" ON public."AspNetUsers" USING btree ("NormalizedEmail");


--
-- TOC entry 2842 (class 1259 OID 17661)
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" USING btree ("RoleId");


--
-- TOC entry 2848 (class 1259 OID 17662)
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" USING btree ("UserId");


--
-- TOC entry 2851 (class 1259 OID 17663)
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON public."AspNetUserLogins" USING btree ("UserId");


--
-- TOC entry 2854 (class 1259 OID 17664)
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" USING btree ("RoleId");


--
-- TOC entry 2847 (class 1259 OID 17665)
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "RoleNameIndex" ON public."AspNetRoles" USING btree ("NormalizedName");


--
-- TOC entry 2862 (class 1259 OID 17666)
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UserNameIndex" ON public."AspNetUsers" USING btree ("NormalizedUserName");


--
-- TOC entry 2865 (class 2606 OID 17667)
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2866 (class 2606 OID 17672)
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2867 (class 2606 OID 17677)
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2868 (class 2606 OID 17682)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 2869 (class 2606 OID 17687)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2870 (class 2606 OID 17692)
-- Name: AspNetUserTokens FK_AspNetUserTokens_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


-- Completed on 2020-05-29 12:07:09

--
-- PostgreSQL database dump complete
--

