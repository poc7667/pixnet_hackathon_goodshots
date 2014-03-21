--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cafes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cafes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cafes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cafes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cafes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cafes_id_seq OWNED BY cafes.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    month integer,
    hour integer,
    small_square text,
    square text,
    weather hstore,
    image_id text,
    size text,
    category text,
    thumb text,
    exif hstore,
    title text,
    tags text,
    location hstore,
    type text,
    medium text,
    description text,
    normal text,
    link text,
    "user" hstore,
    bigger text,
    hits hstore,
    uploaded_at text,
    url text,
    original text,
    large text,
    taken_at text,
    dimension hstore,
    focal_length text,
    date_taken text,
    aperture text,
    camera text,
    metering_mode text,
    iso_speed_ratings text,
    city integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    lon geometry(Point),
    lat geometry(Point),
    lonlat geography(Point,4326),
    lonlat_id integer
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: spatials; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatials (
    id integer NOT NULL,
    lonlat geography(Point,4326),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shap1 geometry,
    shp2 geometry,
    path geometry(LineString,3785),
    lon geometry(Point),
    lat geometry(Point)
);


--
-- Name: spatials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spatials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spatials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spatials_id_seq OWNED BY spatials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name text,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cafes ALTER COLUMN id SET DEFAULT nextval('cafes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spatials ALTER COLUMN id SET DEFAULT nextval('spatials_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: cafes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cafes
    ADD CONSTRAINT cafes_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: spatials_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatials
    ADD CONSTRAINT spatials_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_images_on_lonlat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_images_on_lonlat_id ON images USING btree (lonlat_id);


--
-- Name: index_on_cafes_location; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_on_cafes_location ON cafes USING gist (st_geographyfromtext((((('SRID=4326;POINT('::text || longitude) || ' '::text) || latitude) || ')'::text)));


--
-- Name: index_spatials_on_lonlat; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spatials_on_lonlat ON spatials USING gist (lonlat);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO public,postgis;

INSERT INTO schema_migrations (version) VALUES ('20140319143427');

INSERT INTO schema_migrations (version) VALUES ('20140319143840');

INSERT INTO schema_migrations (version) VALUES ('20140319144101');

INSERT INTO schema_migrations (version) VALUES ('20140319145036');

INSERT INTO schema_migrations (version) VALUES ('20140319152245');

INSERT INTO schema_migrations (version) VALUES ('20140320034106');

INSERT INTO schema_migrations (version) VALUES ('20140321090850');

INSERT INTO schema_migrations (version) VALUES ('20140321092556');

INSERT INTO schema_migrations (version) VALUES ('20140321094200');
