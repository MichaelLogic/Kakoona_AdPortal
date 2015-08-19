--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ad_campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_campaigns (
    id integer NOT NULL,
    merch_representative_id integer,
    campaign_title character varying,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    slug character varying,
    merchant_info_url character varying,
    campaign_reach character varying,
    campaign_plays integer DEFAULT 0 NOT NULL,
    clickthru integer DEFAULT 0 NOT NULL,
    purchases integer DEFAULT 0 NOT NULL,
    campaign_price double precision,
    merchant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ad_campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ad_campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ad_campaigns_id_seq OWNED BY ad_campaigns.id;


--
-- Name: ad_portal_overviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_portal_overviews (
    id integer NOT NULL,
    merchant_id integer,
    total_streams integer DEFAULT 0 NOT NULL,
    total_listens integer DEFAULT 0 NOT NULL,
    total_clicks integer DEFAULT 0 NOT NULL,
    clickthru_rate double precision,
    time_period character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ad_portal_overviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ad_portal_overviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_portal_overviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ad_portal_overviews_id_seq OWNED BY ad_portal_overviews.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    location_nickname integer,
    address_type character varying NOT NULL,
    address_line01 character varying,
    address_line02 character varying,
    city character varying,
    state_province character varying,
    postal_code character varying,
    country_region character varying,
    lat double precision,
    lng double precision
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: avatar_grffks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE avatar_grffks (
    id integer NOT NULL,
    merch_representative_id integer,
    grffk_file_name character varying,
    grffk_content_type character varying,
    grffk_file_size integer,
    grffk_updated_at timestamp without time zone,
    cloud_asset_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: avatar_grffks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE avatar_grffks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: avatar_grffks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE avatar_grffks_id_seq OWNED BY avatar_grffks.id;


--
-- Name: campaign_brand_grffks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaign_brand_grffks (
    id integer NOT NULL,
    ad_campaign_id integer,
    grffk_file_name character varying,
    grffk_content_type character varying,
    grffk_file_size integer,
    grffk_updated_at timestamp without time zone,
    cloud_asset_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: campaign_brand_grffks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_brand_grffks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaign_brand_grffks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_brand_grffks_id_seq OWNED BY campaign_brand_grffks.id;


--
-- Name: campaign_preload_grffks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaign_preload_grffks (
    id integer NOT NULL,
    ad_campaign_id integer,
    grffk_file_name character varying,
    grffk_content_type character varying,
    grffk_file_size integer,
    grffk_updated_at timestamp without time zone,
    cloud_asset_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: campaign_preload_grffks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_preload_grffks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaign_preload_grffks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_preload_grffks_id_seq OWNED BY campaign_preload_grffks.id;


--
-- Name: content_providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE content_providers (
    id integer NOT NULL,
    email character varying NOT NULL,
    screen_name character varying NOT NULL,
    first_name character varying NOT NULL,
    middle_name character varying,
    last_name character varying NOT NULL,
    phone character varying NOT NULL,
    team_role character varying NOT NULL,
    rep_about text,
    is_active boolean NOT NULL,
    auth_token character varying,
    last_session_time timestamp without time zone,
    last_session_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: content_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE content_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE content_providers_id_seq OWNED BY content_providers.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE custom_fields (
    id integer NOT NULL,
    key text,
    value text,
    custom_fieldable_id integer,
    custom_fieldable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE custom_fields_id_seq OWNED BY custom_fields.id;


--
-- Name: kakoona_videos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE kakoona_videos (
    id integer NOT NULL,
    ad_campaign_id integer,
    movie_file_name character varying,
    movie_content_type character varying,
    movie_file_size integer,
    movie_updated_at timestamp without time zone,
    length integer,
    title character varying,
    description character varying,
    movie_views integer DEFAULT 0 NOT NULL,
    cloud_asset_url character varying,
    selected_thum character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: kakoona_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE kakoona_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kakoona_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE kakoona_videos_id_seq OWNED BY kakoona_videos.id;


--
-- Name: merch_representatives; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE merch_representatives (
    id integer NOT NULL,
    merchant_id integer,
    email character varying NOT NULL,
    screen_name character varying NOT NULL,
    first_name character varying NOT NULL,
    middle_name character varying,
    last_name character varying NOT NULL,
    phone character varying NOT NULL,
    team_role character varying NOT NULL,
    rep_about text,
    is_active boolean NOT NULL,
    auth_token character varying,
    last_session_time timestamp without time zone,
    last_session_ip character varying,
    password_digest character varying,
    remember_token character varying,
    admin boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: merch_representatives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE merch_representatives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merch_representatives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE merch_representatives_id_seq OWNED BY merch_representatives.id;


--
-- Name: merchants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE merchants (
    id integer NOT NULL,
    merchant_name character varying NOT NULL,
    merchant_website character varying NOT NULL,
    business_license boolean NOT NULL,
    chargeback_email character varying NOT NULL,
    support_email character varying NOT NULL,
    custom_order_init boolean,
    curr_monthly_sales character varying,
    registered_since date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE merchants_id_seq OWNED BY merchants.id;


--
-- Name: product_inventory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_inventory (
    ad_campaign_id integer,
    product_id integer,
    inventory_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    ad_campaign_id integer,
    product_type character varying,
    grffk_file_name character varying,
    grffk_content_type character varying,
    grffk_file_size integer,
    grffk_updated_at timestamp without time zone,
    cloud_asset_url character varying,
    name character varying,
    price double precision,
    in_stock integer DEFAULT 0 NOT NULL,
    description character varying,
    config_vars hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    curr_ip character varying,
    device_token character varying,
    device_spec character varying
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_campaigns ALTER COLUMN id SET DEFAULT nextval('ad_campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_portal_overviews ALTER COLUMN id SET DEFAULT nextval('ad_portal_overviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY avatar_grffks ALTER COLUMN id SET DEFAULT nextval('avatar_grffks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaign_brand_grffks ALTER COLUMN id SET DEFAULT nextval('campaign_brand_grffks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaign_preload_grffks ALTER COLUMN id SET DEFAULT nextval('campaign_preload_grffks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY content_providers ALTER COLUMN id SET DEFAULT nextval('content_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY custom_fields ALTER COLUMN id SET DEFAULT nextval('custom_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY kakoona_videos ALTER COLUMN id SET DEFAULT nextval('kakoona_videos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY merch_representatives ALTER COLUMN id SET DEFAULT nextval('merch_representatives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY merchants ALTER COLUMN id SET DEFAULT nextval('merchants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: ad_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_campaigns
    ADD CONSTRAINT ad_campaigns_pkey PRIMARY KEY (id);


--
-- Name: ad_portal_overviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_portal_overviews
    ADD CONSTRAINT ad_portal_overviews_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: avatar_grffks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY avatar_grffks
    ADD CONSTRAINT avatar_grffks_pkey PRIMARY KEY (id);


--
-- Name: campaign_brand_grffks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaign_brand_grffks
    ADD CONSTRAINT campaign_brand_grffks_pkey PRIMARY KEY (id);


--
-- Name: campaign_preload_grffks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaign_preload_grffks
    ADD CONSTRAINT campaign_preload_grffks_pkey PRIMARY KEY (id);


--
-- Name: content_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY content_providers
    ADD CONSTRAINT content_providers_pkey PRIMARY KEY (id);


--
-- Name: custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: kakoona_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY kakoona_videos
    ADD CONSTRAINT kakoona_videos_pkey PRIMARY KEY (id);


--
-- Name: merch_representatives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY merch_representatives
    ADD CONSTRAINT merch_representatives_pkey PRIMARY KEY (id);


--
-- Name: merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: index_ad_campaigns_on_merch_representative_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_campaigns_on_merch_representative_id ON ad_campaigns USING btree (merch_representative_id);


--
-- Name: index_ad_campaigns_on_merch_representative_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_campaigns_on_merch_representative_id_and_created_at ON ad_campaigns USING btree (merch_representative_id, created_at);


--
-- Name: index_ad_campaigns_on_merchant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_campaigns_on_merchant_id ON ad_campaigns USING btree (merchant_id);


--
-- Name: index_ad_portal_overviews_on_merchant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_portal_overviews_on_merchant_id ON ad_portal_overviews USING btree (merchant_id);


--
-- Name: index_ad_portal_overviews_on_merchant_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ad_portal_overviews_on_merchant_id_and_created_at ON ad_portal_overviews USING btree (merchant_id, created_at);


--
-- Name: index_avatar_grffks_on_merch_representative_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_avatar_grffks_on_merch_representative_id ON avatar_grffks USING btree (merch_representative_id);


--
-- Name: index_campaign_brand_grffks_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaign_brand_grffks_on_ad_campaign_id ON campaign_brand_grffks USING btree (ad_campaign_id);


--
-- Name: index_campaign_brand_grffks_on_ad_campaign_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaign_brand_grffks_on_ad_campaign_id_and_created_at ON campaign_brand_grffks USING btree (ad_campaign_id, created_at);


--
-- Name: index_campaign_preload_grffks_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaign_preload_grffks_on_ad_campaign_id ON campaign_preload_grffks USING btree (ad_campaign_id);


--
-- Name: index_campaign_preload_grffks_on_ad_campaign_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaign_preload_grffks_on_ad_campaign_id_and_created_at ON campaign_preload_grffks USING btree (ad_campaign_id, created_at);


--
-- Name: index_kakoona_videos_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_kakoona_videos_on_ad_campaign_id ON kakoona_videos USING btree (ad_campaign_id);


--
-- Name: index_kakoona_videos_on_ad_campaign_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_kakoona_videos_on_ad_campaign_id_and_created_at ON kakoona_videos USING btree (ad_campaign_id, created_at);


--
-- Name: index_merch_representatives_on_email_and_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_merch_representatives_on_email_and_remember_token ON merch_representatives USING btree (email, remember_token);


--
-- Name: index_merch_representatives_on_merchant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_merch_representatives_on_merchant_id ON merch_representatives USING btree (merchant_id);


--
-- Name: index_merch_representatives_on_merchant_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_merch_representatives_on_merchant_id_and_created_at ON merch_representatives USING btree (merchant_id, created_at);


--
-- Name: index_product_inventory_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_inventory_on_ad_campaign_id ON product_inventory USING btree (ad_campaign_id);


--
-- Name: index_product_inventory_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_inventory_on_product_id ON product_inventory USING btree (product_id);


--
-- Name: index_products_on_ad_campaign_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_ad_campaign_id ON products USING btree (ad_campaign_id);


--
-- Name: index_products_on_ad_campaign_id_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_ad_campaign_id_and_created_at ON products USING btree (ad_campaign_id, created_at);


--
-- Name: index_products_on_config_vars; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_config_vars ON products USING gin (config_vars);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141217124941');

