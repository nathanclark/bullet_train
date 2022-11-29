--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

SET
statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

--
-- Name: petrobooks3_development; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE
DATABASE petrobooks3_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER
DATABASE petrobooks3_development OWNER TO postgres;

\connect
petrobooks3_development

SET statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

SET
default_tablespace = '';

SET
default_table_access_method = heap;

--
-- Name: action_mailbox_inbound_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_mailbox_inbound_emails
(
    id               bigint            NOT NULL,
    status           integer DEFAULT 0 NOT NULL,
    message_id       character varying NOT NULL,
    message_checksum character varying NOT NULL,
    created_at       timestamp(6) without time zone NOT NULL,
    updated_at       timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_mailbox_inbound_emails OWNER TO postgres;

--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_mailbox_inbound_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.action_mailbox_inbound_emails_id_seq OWNER TO postgres;

--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_mailbox_inbound_emails_id_seq OWNED BY public.action_mailbox_inbound_emails.id;


--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_text_rich_texts
(
    id          bigint            NOT NULL,
    name        character varying NOT NULL,
    body        text,
    record_type character varying NOT NULL,
    record_id   bigint            NOT NULL,
    created_at  timestamp(6) without time zone NOT NULL,
    updated_at  timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments
(
    id          bigint            NOT NULL,
    name        character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id   bigint            NOT NULL,
    blob_id     bigint            NOT NULL,
    created_at  timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs
(
    id           bigint            NOT NULL,
    key          character varying NOT NULL,
    filename     character varying NOT NULL,
    content_type character varying,
    metadata     text,
    byte_size    bigint            NOT NULL,
    checksum     character varying NOT NULL,
    created_at   timestamp without time zone NOT NULL,
    service_name character varying NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records
(
    id               bigint            NOT NULL,
    blob_id          bigint            NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata
(
    key        character varying NOT NULL,
    value      character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies
(
    id         bigint NOT NULL,
    team_id    bigint NOT NULL,
    name       character varying,
    legal_name character varying,
    ein        character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts
(
    id               bigint NOT NULL,
    company_id       bigint NOT NULL,
    contact_type     character varying,
    first_name       character varying,
    last_name        character varying,
    title            character varying,
    email            character varying,
    fax_number       character varying,
    cell_number      character varying,
    work_number      character varying,
    social_link      character varying,
    cloudinary_image character varying,
    company_role     character varying,
    created_at       timestamp(6) without time zone NOT NULL,
    updated_at       timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: integrations_stripe_installations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrations_stripe_installations
(
    id                      bigint NOT NULL,
    team_id                 bigint NOT NULL,
    oauth_stripe_account_id bigint NOT NULL,
    name                    character varying,
    created_at              timestamp(6) without time zone NOT NULL,
    updated_at              timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.integrations_stripe_installations OWNER TO postgres;

--
-- Name: integrations_stripe_installations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integrations_stripe_installations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.integrations_stripe_installations_id_seq OWNER TO postgres;

--
-- Name: integrations_stripe_installations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.integrations_stripe_installations_id_seq OWNED BY public.integrations_stripe_installations.id;


--
-- Name: invitations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitations
(
    id                 integer NOT NULL,
    email              character varying,
    uuid               character varying,
    from_membership_id integer,
    created_at         timestamp without time zone NOT NULL,
    updated_at         timestamp without time zone NOT NULL,
    team_id            integer
);


ALTER TABLE public.invitations OWNER TO postgres;

--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invitations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.invitations_id_seq OWNER TO postgres;

--
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invitations_id_seq OWNED BY public.invitations.id;


--
-- Name: ledger_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledger_accounts
(
    id                       bigint NOT NULL,
    title                    character varying,
    company_id               bigint NOT NULL,
    ledger_account_number    character varying,
    account_type             character varying,
    account_status           character varying,
    posting_type             character varying,
    alternate_account_number character varying,
    visible                  boolean,
    reporting_excluded       boolean,
    parent_id                integer,
    created_at               timestamp(6) without time zone NOT NULL,
    updated_at               timestamp(6) without time zone NOT NULL,
    sub                      character varying,
    acnt_type                character varying,
    rb_cat                   character varying,
    product                  character varying
);


ALTER TABLE public.ledger_accounts OWNER TO postgres;

--
-- Name: ledger_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ledger_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.ledger_accounts_id_seq OWNER TO postgres;

--
-- Name: ledger_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ledger_accounts_id_seq OWNED BY public.ledger_accounts.id;


--
-- Name: ledger_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledger_entries
(
    id            bigint NOT NULL,
    company_id    bigint NOT NULL,
    post_date     date,
    status        character varying,
    user_id       bigint NOT NULL,
    note          text,
    source_type   character varying,
    fiscal_period character varying,
    created_at    timestamp(6) without time zone NOT NULL,
    updated_at    timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ledger_entries OWNER TO postgres;

--
-- Name: ledger_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ledger_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.ledger_entries_id_seq OWNER TO postgres;

--
-- Name: ledger_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ledger_entries_id_seq OWNED BY public.ledger_entries.id;


--
-- Name: ledger_entry_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledger_entry_details
(
    id                bigint NOT NULL,
    ledger_entry_id   bigint NOT NULL,
    ledger_account_id bigint NOT NULL,
    amount            double precision,
    note              character varying,
    order_number      integer,
    created_at        timestamp(6) without time zone NOT NULL,
    updated_at        timestamp(6) without time zone NOT NULL,
    company_id        bigint
);


ALTER TABLE public.ledger_entry_details OWNER TO postgres;

--
-- Name: ledger_entry_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ledger_entry_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.ledger_entry_details_id_seq OWNER TO postgres;

--
-- Name: ledger_entry_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ledger_entry_details_id_seq OWNED BY public.ledger_entry_details.id;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memberships
(
    id                    integer NOT NULL,
    user_id               integer,
    team_id               integer,
    created_at            timestamp without time zone NOT NULL,
    updated_at            timestamp without time zone NOT NULL,
    invitation_id         bigint,
    user_first_name       character varying,
    user_last_name        character varying,
    user_profile_photo_id character varying,
    user_email            character varying,
    added_by_id           bigint,
    platform_agent_of_id  bigint,
    role_ids              jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.memberships OWNER TO postgres;

--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.memberships_id_seq OWNER TO postgres;

--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;


--
-- Name: memberships_reassignments_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memberships_reassignments_assignments
(
    id                                                              bigint NOT NULL,
    membership_id                                                   bigint NOT NULL,
    scaffolding_completely_concrete_tangible_things_reassignments_i bigint,
    created_at                                                      timestamp(6) without time zone NOT NULL,
    updated_at                                                      timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.memberships_reassignments_assignments OWNER TO postgres;

--
-- Name: memberships_reassignments_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memberships_reassignments_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.memberships_reassignments_assignments_id_seq OWNER TO postgres;

--
-- Name: memberships_reassignments_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memberships_reassignments_assignments_id_seq OWNED BY public.memberships_reassignments_assignments.id;


--
-- Name: memberships_reassignments_scaffolding_completely_concrete_tangi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memberships_reassignments_scaffolding_completely_concrete_tangi
(
    id            bigint NOT NULL,
    membership_id bigint NOT NULL,
    created_at    timestamp(6) without time zone NOT NULL,
    updated_at    timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.memberships_reassignments_scaffolding_completely_concrete_tangi OWNER TO postgres;

--
-- Name: memberships_reassignments_scaffolding_completely_concret_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memberships_reassignments_scaffolding_completely_concret_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.memberships_reassignments_scaffolding_completely_concret_id_seq OWNER TO postgres;

--
-- Name: memberships_reassignments_scaffolding_completely_concret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memberships_reassignments_scaffolding_completely_concret_id_seq OWNED BY public.memberships_reassignments_scaffolding_completely_concrete_tangi.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_grants
(
    id                bigint            NOT NULL,
    resource_owner_id bigint            NOT NULL,
    application_id    bigint            NOT NULL,
    token             character varying NOT NULL,
    expires_in        integer           NOT NULL,
    redirect_uri      text              NOT NULL,
    created_at        timestamp without time zone NOT NULL,
    revoked_at        timestamp without time zone,
    scopes            character varying DEFAULT '':: character varying NOT NULL
);


ALTER TABLE public.oauth_access_grants OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens
(
    id                     bigint            NOT NULL,
    resource_owner_id      bigint,
    application_id         bigint            NOT NULL,
    token                  character varying NOT NULL,
    refresh_token          character varying,
    expires_in             integer,
    revoked_at             timestamp without time zone,
    created_at             timestamp without time zone NOT NULL,
    scopes                 character varying,
    previous_refresh_token character varying DEFAULT '':: character varying NOT NULL,
    description            character varying,
    last_used_at           timestamp(6) without time zone,
    provisioned            boolean           DEFAULT false
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_applications
(
    id           bigint                         NOT NULL,
    name         character varying              NOT NULL,
    uid          character varying              NOT NULL,
    secret       character varying              NOT NULL,
    redirect_uri text,
    scopes       character varying DEFAULT '':: character varying NOT NULL,
    confidential boolean           DEFAULT true NOT NULL,
    created_at   timestamp(6) without time zone NOT NULL,
    updated_at   timestamp(6) without time zone NOT NULL,
    team_id      bigint                         NOT NULL
);


ALTER TABLE public.oauth_applications OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: oauth_stripe_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_stripe_accounts
(
    id         bigint NOT NULL,
    uid        character varying,
    data       jsonb,
    user_id    bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.oauth_stripe_accounts OWNER TO postgres;

--
-- Name: oauth_stripe_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_stripe_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.oauth_stripe_accounts_id_seq OWNER TO postgres;

--
-- Name: oauth_stripe_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_stripe_accounts_id_seq OWNED BY public.oauth_stripe_accounts.id;


--
-- Name: postal_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postal_addresses
(
    id           bigint NOT NULL,
    company_id   bigint NOT NULL,
    address_type integer,
    street1      character varying,
    street2      character varying,
    city         character varying,
    state        character varying,
    zipcode      character varying,
    created_at   timestamp(6) without time zone NOT NULL,
    updated_at   timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.postal_addresses OWNER TO postgres;

--
-- Name: postal_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.postal_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.postal_addresses_id_seq OWNER TO postgres;

--
-- Name: postal_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.postal_addresses_id_seq OWNED BY public.postal_addresses.id;


--
-- Name: scaffolding_absolutely_abstract_creative_concepts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scaffolding_absolutely_abstract_creative_concepts
(
    id          bigint NOT NULL,
    team_id     bigint NOT NULL,
    name        character varying,
    description text,
    created_at  timestamp(6) without time zone NOT NULL,
    updated_at  timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.scaffolding_absolutely_abstract_creative_concepts OWNER TO postgres;

--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collaborators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scaffolding_absolutely_abstract_creative_concepts_collaborators
(
    id                  bigint NOT NULL,
    creative_concept_id bigint NOT NULL,
    membership_id       bigint NOT NULL,
    created_at          timestamp(6) without time zone NOT NULL,
    updated_at          timestamp(6) without time zone NOT NULL,
    role_ids            jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.scaffolding_absolutely_abstract_creative_concepts_collaborators OWNER TO postgres;

--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collab_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scaffolding_absolutely_abstract_creative_concepts_collab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.scaffolding_absolutely_abstract_creative_concepts_collab_id_seq OWNER TO postgres;

--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scaffolding_absolutely_abstract_creative_concepts_collab_id_seq OWNED BY public.scaffolding_absolutely_abstract_creative_concepts_collaborators.id;


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scaffolding_absolutely_abstract_creative_concepts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.scaffolding_absolutely_abstract_creative_concepts_id_seq OWNER TO postgres;

--
-- Name: scaffolding_absolutely_abstract_creative_concepts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scaffolding_absolutely_abstract_creative_concepts_id_seq OWNED BY public.scaffolding_absolutely_abstract_creative_concepts.id;


--
-- Name: scaffolding_completely_concrete_tangible_things; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scaffolding_completely_concrete_tangible_things
(
    id                                      bigint NOT NULL,
    absolutely_abstract_creative_concept_id bigint NOT NULL,
    text_field_value                        character varying,
    button_value                            character varying,
    cloudinary_image_value                  character varying,
    date_field_value                        date,
    email_field_value                       character varying,
    password_field_value                    character varying,
    phone_field_value                       character varying,
    super_select_value                      character varying,
    text_area_value                         text,
    created_at                              timestamp(6) without time zone NOT NULL,
    updated_at                              timestamp(6) without time zone NOT NULL,
    sort_order                              integer,
    date_and_time_field_value               timestamp without time zone,
    multiple_button_values                  jsonb DEFAULT '[]'::jsonb,
    multiple_super_select_values            jsonb DEFAULT '[]'::jsonb,
    color_picker_value                      character varying,
    boolean_button_value                    boolean,
    option_value                            character varying,
    multiple_option_values                  jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.scaffolding_completely_concrete_tangible_things OWNER TO postgres;

--
-- Name: scaffolding_completely_concrete_tangible_things_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scaffolding_completely_concrete_tangible_things_assignments
(
    id                bigint NOT NULL,
    tangible_thing_id bigint,
    membership_id     bigint,
    created_at        timestamp without time zone NOT NULL,
    updated_at        timestamp without time zone NOT NULL
);


ALTER TABLE public.scaffolding_completely_concrete_tangible_things_assignments OWNER TO postgres;

--
-- Name: scaffolding_completely_concrete_tangible_things_assignme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scaffolding_completely_concrete_tangible_things_assignme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.scaffolding_completely_concrete_tangible_things_assignme_id_seq OWNER TO postgres;

--
-- Name: scaffolding_completely_concrete_tangible_things_assignme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scaffolding_completely_concrete_tangible_things_assignme_id_seq OWNED BY public.scaffolding_completely_concrete_tangible_things_assignments.id;


--
-- Name: scaffolding_completely_concrete_tangible_things_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scaffolding_completely_concrete_tangible_things_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.scaffolding_completely_concrete_tangible_things_id_seq OWNER TO postgres;

--
-- Name: scaffolding_completely_concrete_tangible_things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scaffolding_completely_concrete_tangible_things_id_seq OWNED BY public.scaffolding_completely_concrete_tangible_things.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations
(
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams
(
    id              integer NOT NULL,
    name            character varying,
    slug            character varying,
    created_at      timestamp without time zone NOT NULL,
    updated_at      timestamp without time zone NOT NULL,
    being_destroyed boolean,
    time_zone       character varying,
    locale          character varying
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users
(
    id                              integer                         NOT NULL,
    email                           character varying DEFAULT '':: character varying NOT NULL,
    encrypted_password              character varying DEFAULT '':: character varying NOT NULL,
    reset_password_token            character varying,
    reset_password_sent_at          timestamp without time zone,
    remember_created_at             timestamp without time zone,
    sign_in_count                   integer           DEFAULT 0     NOT NULL,
    current_sign_in_at              timestamp without time zone,
    last_sign_in_at                 timestamp without time zone,
    current_sign_in_ip              inet,
    last_sign_in_ip                 inet,
    created_at                      timestamp without time zone NOT NULL,
    updated_at                      timestamp without time zone NOT NULL,
    current_team_id                 integer,
    first_name                      character varying,
    last_name                       character varying,
    time_zone                       character varying,
    last_seen_at                    timestamp without time zone,
    profile_photo_id                character varying,
    ability_cache                   jsonb,
    last_notification_email_sent_at timestamp without time zone,
    former_user                     boolean           DEFAULT false NOT NULL,
    encrypted_otp_secret            character varying,
    encrypted_otp_secret_iv         character varying,
    encrypted_otp_secret_salt       character varying,
    consumed_timestep               integer,
    otp_required_for_login          boolean,
    otp_backup_codes                character varying[],
    locale                          character varying,
    platform_agent_of_id            bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: webhooks_incoming_bullet_train_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_incoming_bullet_train_webhooks
(
    id           bigint NOT NULL,
    data         jsonb,
    processed_at timestamp without time zone,
    created_at   timestamp without time zone NOT NULL,
    updated_at   timestamp without time zone NOT NULL,
    verified_at  timestamp without time zone
);


ALTER TABLE public.webhooks_incoming_bullet_train_webhooks OWNER TO postgres;

--
-- Name: webhooks_incoming_bullet_train_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_incoming_bullet_train_webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_incoming_bullet_train_webhooks_id_seq OWNER TO postgres;

--
-- Name: webhooks_incoming_bullet_train_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_incoming_bullet_train_webhooks_id_seq OWNED BY public.webhooks_incoming_bullet_train_webhooks.id;


--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_incoming_oauth_stripe_account_webhooks
(
    id                      bigint NOT NULL,
    data                    jsonb,
    processed_at            timestamp without time zone,
    verified_at             timestamp without time zone,
    oauth_stripe_account_id bigint,
    created_at              timestamp without time zone NOT NULL,
    updated_at              timestamp without time zone NOT NULL
);


ALTER TABLE public.webhooks_incoming_oauth_stripe_account_webhooks OWNER TO postgres;

--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_incoming_oauth_stripe_account_webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_incoming_oauth_stripe_account_webhooks_id_seq OWNER TO postgres;

--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_incoming_oauth_stripe_account_webhooks_id_seq OWNED BY public.webhooks_incoming_oauth_stripe_account_webhooks.id;


--
-- Name: webhooks_outgoing_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_outgoing_deliveries
(
    id           bigint NOT NULL,
    endpoint_id  integer,
    event_id     integer,
    endpoint_url text,
    created_at   timestamp without time zone NOT NULL,
    updated_at   timestamp without time zone NOT NULL,
    delivered_at timestamp without time zone
);


ALTER TABLE public.webhooks_outgoing_deliveries OWNER TO postgres;

--
-- Name: webhooks_outgoing_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_outgoing_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_outgoing_deliveries_id_seq OWNER TO postgres;

--
-- Name: webhooks_outgoing_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_outgoing_deliveries_id_seq OWNED BY public.webhooks_outgoing_deliveries.id;


--
-- Name: webhooks_outgoing_delivery_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_outgoing_delivery_attempts
(
    id               bigint NOT NULL,
    delivery_id      integer,
    response_code    integer,
    response_body    text,
    created_at       timestamp without time zone NOT NULL,
    updated_at       timestamp without time zone NOT NULL,
    response_message text,
    error_message    text,
    attempt_number   integer
);


ALTER TABLE public.webhooks_outgoing_delivery_attempts OWNER TO postgres;

--
-- Name: webhooks_outgoing_delivery_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_outgoing_delivery_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_outgoing_delivery_attempts_id_seq OWNER TO postgres;

--
-- Name: webhooks_outgoing_delivery_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_outgoing_delivery_attempts_id_seq OWNED BY public.webhooks_outgoing_delivery_attempts.id;


--
-- Name: webhooks_outgoing_endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_outgoing_endpoints
(
    id             bigint NOT NULL,
    team_id        bigint,
    url            text,
    created_at     timestamp without time zone NOT NULL,
    updated_at     timestamp without time zone NOT NULL,
    name           character varying,
    event_type_ids jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.webhooks_outgoing_endpoints OWNER TO postgres;

--
-- Name: webhooks_outgoing_endpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_outgoing_endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_outgoing_endpoints_id_seq OWNER TO postgres;

--
-- Name: webhooks_outgoing_endpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_outgoing_endpoints_id_seq OWNED BY public.webhooks_outgoing_endpoints.id;


--
-- Name: webhooks_outgoing_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_outgoing_events
(
    id            bigint NOT NULL,
    subject_id    integer,
    subject_type  character varying,
    data          jsonb,
    created_at    timestamp without time zone NOT NULL,
    updated_at    timestamp without time zone NOT NULL,
    team_id       bigint,
    uuid          character varying,
    payload       jsonb,
    event_type_id character varying
);


ALTER TABLE public.webhooks_outgoing_events OWNER TO postgres;

--
-- Name: webhooks_outgoing_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhooks_outgoing_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.webhooks_outgoing_events_id_seq OWNER TO postgres;

--
-- Name: webhooks_outgoing_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhooks_outgoing_events_id_seq OWNED BY public.webhooks_outgoing_events.id;


--
-- Name: action_mailbox_inbound_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails ALTER COLUMN id SET DEFAULT nextval('public.action_mailbox_inbound_emails_id_seq'::regclass);


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: integrations_stripe_installations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_stripe_installations ALTER COLUMN id SET DEFAULT nextval('public.integrations_stripe_installations_id_seq'::regclass);


--
-- Name: invitations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations ALTER COLUMN id SET DEFAULT nextval('public.invitations_id_seq'::regclass);


--
-- Name: ledger_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_accounts ALTER COLUMN id SET DEFAULT nextval('public.ledger_accounts_id_seq'::regclass);


--
-- Name: ledger_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entries ALTER COLUMN id SET DEFAULT nextval('public.ledger_entries_id_seq'::regclass);


--
-- Name: ledger_entry_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entry_details ALTER COLUMN id SET DEFAULT nextval('public.ledger_entry_details_id_seq'::regclass);


--
-- Name: memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);


--
-- Name: memberships_reassignments_assignments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_assignments ALTER COLUMN id SET DEFAULT nextval('public.memberships_reassignments_assignments_id_seq'::regclass);


--
-- Name: memberships_reassignments_scaffolding_completely_concrete_tangi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_scaffolding_completely_concrete_tangi ALTER COLUMN id SET DEFAULT nextval('public.memberships_reassignments_scaffolding_completely_concret_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: oauth_stripe_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_stripe_accounts ALTER COLUMN id SET DEFAULT nextval('public.oauth_stripe_accounts_id_seq'::regclass);


--
-- Name: postal_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postal_addresses ALTER COLUMN id SET DEFAULT nextval('public.postal_addresses_id_seq'::regclass);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts ALTER COLUMN id SET DEFAULT nextval('public.scaffolding_absolutely_abstract_creative_concepts_id_seq'::regclass);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collaborators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts_collaborators ALTER COLUMN id SET DEFAULT nextval('public.scaffolding_absolutely_abstract_creative_concepts_collab_id_seq'::regclass);


--
-- Name: scaffolding_completely_concrete_tangible_things id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things ALTER COLUMN id SET DEFAULT nextval('public.scaffolding_completely_concrete_tangible_things_id_seq'::regclass);


--
-- Name: scaffolding_completely_concrete_tangible_things_assignments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things_assignments ALTER COLUMN id SET DEFAULT nextval('public.scaffolding_completely_concrete_tangible_things_assignme_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: webhooks_incoming_bullet_train_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_incoming_bullet_train_webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_incoming_bullet_train_webhooks_id_seq'::regclass);


--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_incoming_oauth_stripe_account_webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_incoming_oauth_stripe_account_webhooks_id_seq'::regclass);


--
-- Name: webhooks_outgoing_deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_deliveries ALTER COLUMN id SET DEFAULT nextval('public.webhooks_outgoing_deliveries_id_seq'::regclass);


--
-- Name: webhooks_outgoing_delivery_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_delivery_attempts ALTER COLUMN id SET DEFAULT nextval('public.webhooks_outgoing_delivery_attempts_id_seq'::regclass);


--
-- Name: webhooks_outgoing_endpoints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_endpoints ALTER COLUMN id SET DEFAULT nextval('public.webhooks_outgoing_endpoints_id_seq'::regclass);


--
-- Name: webhooks_outgoing_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_events ALTER COLUMN id SET DEFAULT nextval('public.webhooks_outgoing_events_id_seq'::regclass);


--
-- Data for Name: action_mailbox_inbound_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_mailbox_inbound_emails (id, status, message_id, message_checksum, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\
.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at, service_name) FROM stdin;
\
.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\
.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment
development	2022-11-25 23:50:27.999823	2022-11-25 23:50:27.999823
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, team_id, name, legal_name, ein, created_at, updated_at) FROM stdin;
1669420366	1	Oil and Gas Test Company	Oil and Gas Test Company	23123	2022-11-25 23:52:46.147473	2022-11-25 23:52:46.147473
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, company_id, contact_type, first_name, last_name, title, email, fax_number, cell_number, work_number, social_link, cloudinary_image, company_role, created_at, updated_at) FROM stdin;
1	1669420366	one	John	Doe	Owner	nathan@appclan.io							2022-11-25 23:52:46.155416	2022-11-25 23:52:46.155416
\.


--
-- Data for Name: integrations_stripe_installations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.integrations_stripe_installations (id, team_id, oauth_stripe_account_id, name, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invitations (id, email, uuid, from_membership_id, created_at, updated_at, team_id) FROM stdin;
\
.


--
-- Data for Name: ledger_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledger_accounts (id, title, company_id, ledger_account_number, account_type, account_status, posting_type, alternate_account_number, visible, reporting_excluded, parent_id, created_at, updated_at, sub, acnt_type, rb_cat, product) FROM stdin;
839	Cash - FNB - Checking	1669420366	1001
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
840	Cash - FNB Ardmore	1669420366	1010
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
841	Cash - FNB - Revenue	1669420366	1020
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
842	Cash - FNB - Money Market	1669420366	1030
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
843	Cash - FNB - Payroll	1669420366	1040
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
844	Cash - FFB - Checking	1669420366	1045
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
845	Purchaser Clearing	1669420366	1050
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	PURCHASERS	A
\N
\N
846	Accounts Receivable - JIB	1669420366	1200
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	A
\N
\N
847	Accounts Receivable	1669420366	1202
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	10	A
\N
\N
848	A/R - NM Four Partnership	1669420366	1210
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	A
\N
\N
849	A/R - OK Four Partnership	1669420366	1211
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	A
\N
\N
850	A/R - Revenue ACH Clearing	1669420366	1230
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	A
\N
\N
851	Accounts Receivable - Del. Int	1669420366	1250
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
852	Notes Receivable 1031 Exchange	1669420366	1260
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	A
\N
\N
853	Prepaid Child Support Clearing	1669420366	1280
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	40	A
\N
\N
854	Prepaid Insurance	1669420366	1300
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
855	Prepaid Oil & Gas Expenses	1669420366	1310
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
856	Prepaid Federal Taxes	1669420366	1350
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
857	Prepaid State Income Taxes	1669420366	1351
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	95	A
\N
\N
858	Leasehold Costs - Developed	1669420366	1400
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
859	Leasehold Costs - Undeveloped	1669420366	1500
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
860	Geological & Geophysical	1669420366	1550
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
861	Lease & Well Equipment	1669420366	1600
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
862	Furniture & Fixtures	1669420366	1700
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
863	Vehicles	1669420366	1710
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
864	Building	1669420366	1750
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
865	Land	1669420366	1760
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
866	Leasehold Improvements	1669420366	1770
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
867	Accumulated Depletion	1669420366	1800
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
868	Accumulated Depletion - L/H	1669420366	1808
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
869	Amortization Allowance - G&G	1669420366	1809
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
870	Accum Depreciation - L&W Eqpt	1669420366	1810
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
871	Accum Depreciation - F & F	1669420366	1820
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
872	Accum Depreciation - Vehicles	1669420366	1830
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
873	Accum Depreciation - LH Improv	1669420366	1840
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
874	Utility Deposit	1669420366	1900
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
875	Organization Costs	1669420366	1990
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
876	Amortization of Org. Costs	1669420366	1991
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
877	Prepaid State Taxes - OK	1669420366	1994
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
878	Prepid State Taxes - NM	1669420366	1995
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
879	Revenue Clearing - Operator	1669420366	1999
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	A
\N
\N
880	Accounts Payable	1669420366	2010
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	20	P
\N
\N
881	Kansas Unemployment Payable	1669420366	2120
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
882	Kansas State W/H Tax Payable	1669420366	2121
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
883	Nevada Unemployment Tax Pay	1669420366	2125
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
884	Nevada State W/H Tax Payable	1669420366	2126
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
885	Insurance Payable	1669420366	2135
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
886	Child Support Payable	1669420366	2150
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
887	IRS Garnishment Payable - Emp	1669420366	2170
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
888	Flex Childcare Payable	1669420366	2175
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	40	L
\N
\N
889	Payroll Tax	1669420366	2179
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
890	Flex Medical Payable	1669420366	2180
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	40	L
\N
\N
891	Revenue Payable-Oil & Gas	1669420366	2200
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
892	Revenue Payable-Legal Suspense	1669420366	2210
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
893	Revenue Payable-Petty Suspense	1669420366	2220
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
894	Severance Tax Payable - TX	1669420366	2225
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
895	Severance Tax Payable - WY	1669420366	2226
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
896	Severance Tax Payable - MT	1669420366	2227
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
897	Kansas O&G Resource Fund	1669420366	2230
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
898	Reserve for Plugging Expenses	1669420366	2250
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
899	Accrued Payroll Expenses	1669420366	2300
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
900	Fed W/H & FICA Payable	1669420366	2301
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
901	Accrued Federal Income Tax	1669420366	2302
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
902	Oklahoma State Withholding	1669420366	2320
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
903	Oklahoma Unemployment Payable	1669420366	2330
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
904	Montana State Withholding	1669420366	2335
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
905	New Mexico State Withholding	1669420366	2340
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
906	New Mexico Unemployment Pay.	1669420366	2350
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
907	Pennsylvania State Withholding	1669420366	2355
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
908	FUTA Payable	1669420366	2360
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
909	SUTA Payable	1669420366	2365
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
910	Child Support Payable	1669420366	2380
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
911	Prepayments Drlg/Compl/WOver	1669420366	2400
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	L
\N
\N
912	Notes Payable - FNB	1669420366	2800
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
913	Notes Payable - Auto	1669420366	2810
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
914	Common Stock	1669420366	3010
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	C
\N
\N
915	Owners Capital - NM Four	1669420366	3410
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	C
\N
\N
916	Owners Capital - OK Four	1669420366	3411
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	101	C
\N
\N
917	Partnership Beginning Balance	1669420366	3510
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	PARTN	C
\N
\N
918	Partnership Contributions	1669420366	3520
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	PARTN	C
\N
\N
919	Partnership Distributions	1669420366	3530
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	PARTN	C
\N
\N
920	Partnership Net Income (Loss)	1669420366	3540
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	PARTN	C
\N
\N
921	Retained Earnings	1669420366	3949
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	C
\N
\N
922	Oil Sales - Working Interest	1669420366	4000
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
923	Oil Sales - Royalty Interest	1669420366	4010
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
924	Oil Sales - Override Interest	1669420366	4011
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
925	Gas Sales - Working Interest	1669420366	4100
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
926	Gas Sales - Royalty Interest	1669420366	4110
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
927	Gas Sales - Override Interest	1669420366	4111
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
928	Plant Product Sales (W)	1669420366	4200
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
929	Plant Product Sales (R)	1669420366	4210
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
930	Plant Product Sales (O)	1669420366	4211
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
931	Turnkey Project Income	1669420366	4400
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	I
\N
\N
932	Income from Admin. Overhead	1669420366	4500
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
933	Income from Billed Pumper Chgs	1669420366	4501
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
934	Income from Gas Mktg/Line Fees	1669420366	4502
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
935	Interest Income	1669420366	4900
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
936	Other Income	1669420366	4950
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
937	Discounts Earned	1669420366	4999
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	I
\N
\N
938	Production Tax - Oil Sales (W)	1669420366	5000
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
939	Production Tax - Oil Sales (R)	1669420366	5001
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
940	Production Tax - Oil Sales (O)	1669420366	5002
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
941	Production Tax - Gas Sales (W)	1669420366	5010
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
942	Production Tax - Gas Sales (R)	1669420366	5011
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
943	Production Tax - Gas Sales (O)	1669420366	5012
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
944	Production Tax - Plant Prod(W)	1669420366	5020
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
945	Production Tax - Plant Prod(R)	1669420366	5021
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
946	Production Tax - Plant Prod(O)	1669420366	5022
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
947	OK State W/H Tax	1669420366	5051
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
948	Lease Operating Expense	1669420366	5100
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
949	Allocated Field Supervision	1669420366	5110
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
950	Marketing Expense (W)	1669420366	5120
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
951	Marketing Expense (R)	1669420366	5121
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
952	Marketing Expense (O)	1669420366	5122
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
953	Other Expense (W)	1669420366	5130
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
954	Other Expense (R)	1669420366	5131
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
955	Other Expense (O)	1669420366	5132
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
956	Turnkey Project Costs	1669420366	5400
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
957	Intangible Drilling Costs	1669420366	5500
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
958	Intangible Completion Costs	1669420366	5510
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
959	Bonus Payments	1669420366	5600
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
960	Surface Damage Payments	1669420366	5610
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
961	Delay Rental Payments	1669420366	5620
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
962	Minimim Royalty Payments	1669420366	5630
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
963	Depreciation - Lease & Well	1669420366	5900
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
964	Amortization of G&G	1669420366	5905
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
965	Depletion	1669420366	5910
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	E
\N
\N
966	OK Yard - Electricity	1669420366	6110
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
967	OK Yard - Equipment Rental	1669420366	6120
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
968	OK Yard - Facilty	1669420366	6130
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
969	OK Yard - Labor	1669420366	6140
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
970	OK Yard - Repairs	1669420366	6150
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
971	OK Yard - Safety	1669420366	6160
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
972	OK Yard - Supplies	1669420366	6170
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
973	OK Yard - Vehicle	1669420366	6180
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
974	OK Yard - Welding	1669420366	6190
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
975	OK Yard - Allocated to Wells	1669420366	6199
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
976	Advertising	1669420366	7000
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
977	Amortization Expense	1669420366	7025
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
978	Auto Expense	1669420366	7050
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	15	E
\N
\N
979	Bad Debt	1669420366	7100
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
980	Bank Charges	1669420366	7120
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
981	Contract Labor	1669420366	7260
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
982	Contributions	1669420366	7265
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
983	Depletion Expense	1669420366	7320
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
984	Depreciation Expense - Vehicle	1669420366	7321
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	15	E
\N
\N
985	Dues & Subscriptions	1669420366	7390
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
986	Employees - Salaries & Wages	1669420366	7400
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
987	Employees - Payroll Taxes	1669420366	7410
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
988	Employees - WC Insurance	1669420366	7430
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
989	Employees-Field Salaries	1669420366	7500
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
990	Employees-Field Mileage	1669420366	7502
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
991	Employees-Field 401K Match	1669420366	7503
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
992	Employee-Field Insurance	1669420366	7504
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
993	Employees-Field Payroll Taxes	1669420366	7510
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
994	Pension Plan	1669420366	7520
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
995	Employees-Field WC Insurance	1669420366	7530
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
996	Field Supervision Allocated	1669420366	7590
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
997	Employees-Admin Salaries	1669420366	7600
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
998	Employees-Admin-401K	1669420366	7603
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
999	Employee-Admin Insurance	1669420366	7604
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1000	Employees-Admin-PR Taxes	1669420366	7610
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1001	Employees-Admin-WC Ins	1669420366	7630
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1002	Insurance-Auto	1669420366	7850
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1003	Insurance-General Liability	1669420366	7851
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1004	Insurance-Umbrella	1669420366	7854
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1005	Taxes - Property	1669420366	7855
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1006	Taxes - Other	1669420366	7860
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1007	Interest Expense	1669420366	7900
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1008	Meals & Entertainment	1669420366	8230
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1009	Miscellaneous	1669420366	8270
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1010	Office Supplies & Postage	1669420366	8440
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1011	Professional Fees	1669420366	8570
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1012	Rent	1669420366	8720
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1013	Rental Machines	1669420366	8721
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1014	Repairs & Maintenance	1669420366	8725
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1015	Seminars/Training	1669420366	8800
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1016	Taxes - Franchise	1669420366	8851
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1017	Telephone	1669420366	8870
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1018	Travel	1669420366	8880
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1019	Utilities	1669420366	8940
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1020	Extraordinary Income	1669420366	8950
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1021	Extraordinary Expense	1669420366	8960
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1022	Corporate Income Tax	1669420366	8990
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	E
\N
\N
1023	Pumper / Gauger	1669420366	9001
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1024	Administrative Overhead	1669420366	9002
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1025	Contract Labor	1669420366	9003
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1026	Electricity	1669420366	9004
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1027	Fuel & Power	1669420366	9005
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1028	Production Foreman/Supervision	1669420366	9006
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1029	Pulling Unit	1669420366	9007
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1030	Chemical & Solvents	1669420366	9008
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1031	Repair & Maintenance	1669420366	9009
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1032	Insurance	1669420366	9010
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1033	Hauling	1669420366	9011
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1034	Materials & Supplies	1669420366	9012
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1035	Hot Oil Treatments	1669420366	9013
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1036	Steam Cleaning	1669420366	9014
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1037	Rentals	1669420366	9015
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1038	Salt Water Disposal	1669420366	9016
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1039	Engineering/Geological	1669420366	9017
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1040	Service Equipment	1669420366	9018
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1041	Consulting Services	1669420366	9019
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1042	Inspection	1669420366	9020
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1043	Acid Treatment	1669420366	9021
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1044	Workover Cost	1669420366	9022
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1045	Water	1669420366	9023
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1046	Wireline Services	1669420366	9024
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1047	Perforating/Logging	1669420366	9025
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1048	Testing	1669420366	9026
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1049	Roads & Location	1669420366	9027
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1050	Compression	1669420366	9028
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1051	Chart Integration	1669420366	9029
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1052	Oklahoma Yard Allocated Costs	1669420366	9030
\N
\N	Yes
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1053	Miscellaneous	1669420366	9090
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1054	Outside Operated - LOE	1669420366	9091
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1055	Ad Valorem Tax	1669420366	9099
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	OPERATING
\N
1056	Acreage Cost - Developed	1669420366	9101
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1057	Recording Fees - Developed	1669420366	9102
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1058	Title Curative - Developed	1669420366	9103
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1059	Legal Fees - Developed	1669420366	9104
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1060	Abstract Fees - Developed	1669420366	9105
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1061	Consulting Services-Developed	1669420366	9106
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1062	Bonus Payments - Developed	1669420366	9107
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1063	Delay Rentals	1669420366	9108
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1064	Miscellaneous - Developed LH	1669420366	9139
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1065	Outside Oper. - Developed LH	1669420366	9140
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	LEASEHOLD
\N
1066	Acreage Cost - Undeveloped	1669420366	9151
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1067	Recording Fees - Undeveloped	1669420366	9152
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1068	Title Curative - Undeveloped	1669420366	9153
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1069	Legal Fees - Undeveloped	1669420366	9154
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1070	Abstract Fees - Undeveloped	1669420366	9155
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1071	Consulting Services - Undev,	1669420366	9156
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1072	Bonus Payments - Undeveloped	1669420366	9157
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1073	Miscellaneous - Undeveloped LH	1669420366	9189
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1074	Outside Oper. - Undeveloped LH	1669420366	9190
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	L/H-UNDEV
\N
1075	Geological & Geophysical	1669420366	9195
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	G&G
\N
1076	Seismic	1669420366	9196
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	G&G
\N
1077	Miscellaneous G&G	1669420366	9197
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	G&G
\N
1078	Outside Operated - G&G	1669420366	9198
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	G&G
\N
1079	Drilling - Footage	1669420366	9201
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1080	Drilling - Daywork	1669420366	9202
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1081	Drilling - Turnkey	1669420366	9203
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1082	Drilling Directional	1669420366	9204
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1083	Drilling Overhead	1669420366	9205
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1084	Contract Labor	1669420366	9206
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1085	Surveys / Permits / Bonds	1669420366	9207
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1086	Cementing & Services	1669420366	9208
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1087	Mud / Chemicals / Water	1669420366	9209
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1088	Reserve Pit	1669420366	9210
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1089	Roads & Location	1669420366	9211
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1090	Equipment Rental	1669420366	9212
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1091	Open Hole Logging	1669420366	9213
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1092	Acidizing & Fracturing	1669420366	9214
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1093	Transportation	1669420366	9215
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1094	Coring & Analysis	1669420366	9216
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1095	Inspection / Testing	1669420366	9217
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1096	Casing Crew / Tongs	1669420366	9218
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1097	Drill Bits	1669420366	9219
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1098	Insurance	1669420366	9220
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1099	Roustabout Services	1669420366	9221
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1100	Consulting Services	1669420366	9222
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1101	Electricity	1669420366	9223
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1102	Fuel	1669420366	9224
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1103	Perforating	1669420366	9225
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1104	Wireline Service	1669420366	9226
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1105	Flow Testing	1669420366	9227
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1106	Engineering/Geological Service	1669420366	9228
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1107	Downhole Logging	1669420366	9229
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1108	Outside Operated - IDC	1669420366	9291
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	IDC
\N
1109	Completion Unit	1669420366	9301
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1110	Mobilization	1669420366	9302
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1111	Workover Unit	1669420366	9303
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1112	Completion Overhead	1669420366	9305
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1113	Contract Labor	1669420366	9306
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1114	Surveys / Permits / Bonds	1669420366	9307
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1115	Cementing & Services	1669420366	9308
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1116	Mud / Chemicals / Water	1669420366	9309
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1117	Reserve Pit	1669420366	9310
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1118	Roads & Location	1669420366	9311
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1119	Equipment Rental	1669420366	9312
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1120	Acidizing & Fracturing	1669420366	9314
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1121	Transportation	1669420366	9315
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1122	Coring & Analysis	1669420366	9316
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1123	Inspection / Testing	1669420366	9317
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1124	Casing Crew / Tongs	1669420366	9318
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1125	Drill Bits	1669420366	9319
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1126	Insurance	1669420366	9320
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1127	Roustabout Services	1669420366	9321
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1128	Consulting Services	1669420366	9322
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1129	Electricity	1669420366	9323
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1130	Fuel	1669420366	9324
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1131	Perforating	1669420366	9325
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1132	Wireline Service	1669420366	9326
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1133	Flow Testing	1669420366	9327
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1134	Engineering/Geological Service	1669420366	9328
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1135	Logging	1669420366	9329
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1136	Outside Operated - ICC	1669420366	9391
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	ICC
\N
1137	Surface Casing	1669420366	9401
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1138	Long String Casing	1669420366	9402
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1139	Tubing	1669420366	9403
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1140	Wellhead Equipment	1669420366	9404
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1141	Pumping Unit	1669420366	9405
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1142	Bottom Hole Pump	1669420366	9406
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1143	Tank Battery	1669420366	9407
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1144	Heater Treater/Separator	1669420366	9408
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1145	Dehydrator	1669420366	9409
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1146	Flowlines	1669420366	9410
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1147	Compressor	1669420366	9411
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1148	Miscellaneous	1669420366	9490
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1149	Outside Operated - Equipment	1669420366	9491
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	B	EQUIPMENT
\N
1150	Billing Offset	1669420366	9599
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	A
\N
\N
1151	Oil Sales	1669420366	9601
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	GROSS	OIL
1152	Oil Production Tax	1669420366	9602
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	OIL
1153	Oil Severance Tax	1669420366	9603
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	OIL
1154	Oil Conservation Tax	1669420366	9604
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	OIL
1155	Oil Ad Valorem Tax	1669420366	9605
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	OIL
1156	Oil Other Deduction	1669420366	9606
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	OIL
1157	JOA Plugging Reserve (.5%)	1669420366	9607
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	OIL
1158	Kansas Resource Fund Fee	1669420366	9610
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	OIL
1159	Gas Sales	1669420366	9621
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	GROSS	GAS
1160	Gas Production Tax	1669420366	9622
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1161	Gas Severance Tax	1669420366	9623
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1162	Gas Conservation Tax	1669420366	9624
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1163	Gas Ad Valorem Tax	1669420366	9625
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1164	Gas Marketing Charge	1669420366	9626
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	GAS
1165	Gas Compression Charge	1669420366	9627
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	GAS
1166	Gas Pipeline Fee	1669420366	9628
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	GAS
1167	Gas Plugging Reserve	1669420366	9629
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	GAS
1168	Kansas Resource Fund Fee	1669420366	9630
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1169	Condensate Sales	1669420366	9641
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	GROSS	CND
1170	Condensate Production Tax	1669420366	9642
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	CND
1171	Condensate Severance Tax	1669420366	9643
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	CND
1172	Condensate Conservation Tax	1669420366	9644
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	CND
1173	Condensate Ad Valorem Tax	1669420366	9645
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	CND
1174	Condensate Other Deduction	1669420366	9646
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	CND
1175	Plant Sales	1669420366	9661
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	GROSS	PRD
1176	Plant Production Tax	1669420366	9662
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	PRD
1177	Plant Other Deduction	1669420366	9666
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER	PRD
1178	Revenue Paid by Others	1669420366	9699
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	OTHER
\N
1179	Gas WI Severance Tax	1669420366	9723
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1180	Gas Roy. Severance Tax	1669420366	9724
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	R	TAXES	GAS
1181	Revenue Offset	1669420366	9799
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1182	Oil Sales (Royalty)	1669420366	9801
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1183	Oil Production Tax (Royalty)	1669420366	9802
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1184	Oil Severance Tax (Royalty)	1669420366	9803
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1185	Oil Conservation Tax (Royalty)	1669420366	9804
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1186	Oil Ad Valorem Tax (Royalty)	1669420366	9805
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1187	Oil Other Deduction (Royalty)	1669420366	9806
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1188	Gas Sales (Royalty)	1669420366	9821
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1189	Gas Production Tax (Royalty)	1669420366	9822
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1190	Gas Severance Tax (Roy)	1669420366	9823
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1191	Gas Conservation Tax (Royalty)	1669420366	9824
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1192	Gas Ad Valorem Tax (Royalty)	1669420366	9825
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1193	Gas Marketing Charge (Royalty)	1669420366	9826
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1194	Gas Compression Charge (Roy)	1669420366	9827
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1195	Gas Pipeline Fee (Royalty)	1669420366	9828
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1196	Condensate Sales (Royalty)	1669420366	9841
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1197	Condensate Production Tax (R)	1669420366	9842
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1198	Condensate Severance Tax (R)	1669420366	9843
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1199	Conden. Conservation Tax (Roy)	1669420366	9844
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1200	Conden. Ad Valorem Tax (Roy)	1669420366	9845
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1201	Conden. Other Deduction (Roy)	1669420366	9846
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1202	Plant Sales (Royalty)	1669420366	9861
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1203	Plant Production Tax (Royalty)	1669420366	9862
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1204	Plant Other Deduction (Roy)	1669420366	9866
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1205	NYMEX Prices for Trend	1669420366	9900
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
1206	DO NOT USE	1669420366	9997
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347
\N	L
\N
\N
1207	Royalty Cutback Offset	1669420366	9998
\N
\N	No
\N
\N
\N
\N	2022-11-21 05:14:20.279347	2022-11-21 05:14:20.279347	50	L
\N
\N
\.


--
-- Data for Name: ledger_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledger_entries (id, company_id, post_date, status, user_id, note, source_type, fiscal_period, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: ledger_entry_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledger_entry_details (id, ledger_entry_id, ledger_account_id, amount, note, order_number, created_at, updated_at, company_id) FROM stdin;
\
.


--
-- Data for Name: memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memberships (id, user_id, team_id, created_at, updated_at, invitation_id, user_first_name, user_last_name, user_profile_photo_id, user_email, added_by_id, platform_agent_of_id, role_ids) FROM stdin;
1	1	1	2022-11-25 23:51:55.064674	2022-11-25 23:51:55.105179
\N
\N
\N
\N
\N
\N
\N	["admin"]
\.


--
-- Data for Name: memberships_reassignments_assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memberships_reassignments_assignments (id, membership_id, scaffolding_completely_concrete_tangible_things_reassignments_i, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: memberships_reassignments_scaffolding_completely_concrete_tangi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memberships_reassignments_scaffolding_completely_concrete_tangi (id, membership_id, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\
.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes, previous_refresh_token, description, last_used_at, provisioned) FROM stdin;
\
.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, confidential, created_at, updated_at, team_id) FROM stdin;
\
.


--
-- Data for Name: oauth_stripe_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_stripe_accounts (id, uid, data, user_id, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: postal_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postal_addresses (id, company_id, address_type, street1, street2, city, state, zipcode, created_at, updated_at) FROM stdin;
1	1669420366
\N	1810 Oakleaf Cir		Pearland	alabama	77581	2022-11-25 23:52:46.151625	2022-11-25 23:52:46.151625
\.


--
-- Data for Name: scaffolding_absolutely_abstract_creative_concepts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scaffolding_absolutely_abstract_creative_concepts (id, team_id, name, description, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: scaffolding_absolutely_abstract_creative_concepts_collaborators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scaffolding_absolutely_abstract_creative_concepts_collaborators (id, creative_concept_id, membership_id, created_at, updated_at, role_ids) FROM stdin;
\
.


--
-- Data for Name: scaffolding_completely_concrete_tangible_things; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scaffolding_completely_concrete_tangible_things (id, absolutely_abstract_creative_concept_id, text_field_value, button_value, cloudinary_image_value, date_field_value, email_field_value, password_field_value, phone_field_value, super_select_value, text_area_value, created_at, updated_at, sort_order, date_and_time_field_value, multiple_button_values, multiple_super_select_values, color_picker_value, boolean_button_value, option_value, multiple_option_values) FROM stdin;
\
.


--
-- Data for Name: scaffolding_completely_concrete_tangible_things_assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scaffolding_completely_concrete_tangible_things_assignments (id, tangible_thing_id, membership_id, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20161115160419
20161116003852
20161117154605
20161117154709
20161203193930
20161204234150
20161205154821
20161205164613
20170908205756
20170912050334
20170915215309
20171104204911
20171104225620
20171105001408
20180326124105
20180420013127
20180420013505
20180420013852
20180420014623
20180420021016
20180420022027
20180420165345
20180420172112
20180425034740
20180706214509
20180902142328
20180902142350
20180902142822
20180902143758
20180902154611
20180902154652
20180902195848
20180903101707
20180903185701
20181012234232
20181013030208
20181013165056
20181013174539
20181013192951
20190106013242
20190124034854
20190124040656
20190224204755
20190224221839
20190310235546
20190321203224
20190330195809
20190519230202
20190628194704
20191021215724
20191021233425
20191025053512
20191204020251
20191204020913
20191204020914
20191225224034
20200101203645
20200211034208
20200211044616
20200213052748
20200213235037
20200219013834
20200219015116
20200328203304
20200328205444
20200726222314
20200727171308
20200727175949
20210101210524
20210101231429
20210109142834
20210109170223
20210114200645
20210114200646
20210217014158
20210224234445
20210304133200
20210304200925
20210304203705
20210310164021
20210316215919
20210316220614
20210316220615
20210317150916
20210414153701
20210511152422
20210511152851
20210513013030
20210514051642
20210602230736
20210805060451
20210816072419
20210816072508
20211018173808
20211020191034
20211020200855
20211021230439
20211021230724
20211027002944
20211126230846
20211126230847
20211127013539
20211127013800
20211127014001
20211127015712
20211127015713
20211129044008
20211130142547
20220223210337
20220418034147
20220905171758
20221103195717
20221103200900
20221118200655
20221119040458
20221121055054
20221121055630
20221122225533
20221125232140
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, slug, created_at, updated_at, being_destroyed, time_zone, locale) FROM stdin;
1	Test Accounting Team
\N	2022-11-25 23:51:55.032061	2022-11-25 23:52:09.427187
\N	Central Time (US & Canada)
\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, current_team_id, first_name, last_name, time_zone, last_seen_at, profile_photo_id, ability_cache, last_notification_email_sent_at, former_user, encrypted_otp_secret, encrypted_otp_secret_iv, encrypted_otp_secret_salt, consumed_timestep, otp_required_for_login, otp_backup_codes, locale, platform_agent_of_id) FROM stdin;
1	nathanclark80@gmail.com	$2a$11$55RBUghdovdBLXBbSXO1Me687fBQ6QEzrRdKnYKVvyqDHlPL.I3kK
\N
\N
\N	1	2022-11-25 23:51:54.956701	2022-11-25 23:51:54.956701	::1	::1	2022-11-25 23:51:54.558579	2022-11-26 00:13:45.409542	1	Nathan	Clark	Central Time (US & Canada)	2022-11-26 00:13:45.408767
\N	{"admin_memberships_team_ids": [1], "editor_memberships_team_ids": [1], "default_memberships_team_ids": [1]}
\N	f
\N
\N
\N
\N
\N
\N
\N
\N
\.


--
-- Data for Name: webhooks_incoming_bullet_train_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_incoming_bullet_train_webhooks (id, data, processed_at, created_at, updated_at, verified_at) FROM stdin;
\
.


--
-- Data for Name: webhooks_incoming_oauth_stripe_account_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_incoming_oauth_stripe_account_webhooks (id, data, processed_at, verified_at, oauth_stripe_account_id, created_at, updated_at) FROM stdin;
\
.


--
-- Data for Name: webhooks_outgoing_deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_outgoing_deliveries (id, endpoint_id, event_id, endpoint_url, created_at, updated_at, delivered_at) FROM stdin;
\
.


--
-- Data for Name: webhooks_outgoing_delivery_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_outgoing_delivery_attempts (id, delivery_id, response_code, response_body, created_at, updated_at, response_message, error_message, attempt_number) FROM stdin;
\
.


--
-- Data for Name: webhooks_outgoing_endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_outgoing_endpoints (id, team_id, url, created_at, updated_at, name, event_type_ids) FROM stdin;
\
.


--
-- Data for Name: webhooks_outgoing_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_outgoing_events (id, subject_id, subject_type, data, created_at, updated_at, team_id, uuid, payload, event_type_id) FROM stdin;
\
.


--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_mailbox_inbound_emails_id_seq', 1, false);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, true);


--
-- Name: integrations_stripe_installations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.integrations_stripe_installations_id_seq', 1, false);


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invitations_id_seq', 1, false);


--
-- Name: ledger_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ledger_accounts_id_seq', 1207, true);


--
-- Name: ledger_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ledger_entries_id_seq', 1, false);


--
-- Name: ledger_entry_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ledger_entry_details_id_seq', 1, false);


--
-- Name: memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.memberships_id_seq', 1, true);


--
-- Name: memberships_reassignments_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.memberships_reassignments_assignments_id_seq', 1, false);


--
-- Name: memberships_reassignments_scaffolding_completely_concret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.memberships_reassignments_scaffolding_completely_concret_id_seq', 1, false);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, false);


--
-- Name: oauth_stripe_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_stripe_accounts_id_seq', 1, false);


--
-- Name: postal_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postal_addresses_id_seq', 1, true);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scaffolding_absolutely_abstract_creative_concepts_collab_id_seq', 1, false);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scaffolding_absolutely_abstract_creative_concepts_id_seq', 1, false);


--
-- Name: scaffolding_completely_concrete_tangible_things_assignme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scaffolding_completely_concrete_tangible_things_assignme_id_seq', 1, false);


--
-- Name: scaffolding_completely_concrete_tangible_things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scaffolding_completely_concrete_tangible_things_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: webhooks_incoming_bullet_train_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_incoming_bullet_train_webhooks_id_seq', 1, false);


--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_incoming_oauth_stripe_account_webhooks_id_seq', 1, false);


--
-- Name: webhooks_outgoing_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_outgoing_deliveries_id_seq', 1, false);


--
-- Name: webhooks_outgoing_delivery_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_outgoing_delivery_attempts_id_seq', 1, false);


--
-- Name: webhooks_outgoing_endpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_outgoing_endpoints_id_seq', 1, false);


--
-- Name: webhooks_outgoing_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhooks_outgoing_events_id_seq', 1, false);


--
-- Name: action_mailbox_inbound_emails action_mailbox_inbound_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails
    ADD CONSTRAINT action_mailbox_inbound_emails_pkey PRIMARY KEY (id);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: integrations_stripe_installations integrations_stripe_installations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_stripe_installations
    ADD CONSTRAINT integrations_stripe_installations_pkey PRIMARY KEY (id);


--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: ledger_accounts ledger_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_accounts
    ADD CONSTRAINT ledger_accounts_pkey PRIMARY KEY (id);


--
-- Name: ledger_entries ledger_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entries
    ADD CONSTRAINT ledger_entries_pkey PRIMARY KEY (id);


--
-- Name: ledger_entry_details ledger_entry_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entry_details
    ADD CONSTRAINT ledger_entry_details_pkey PRIMARY KEY (id);


--
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: memberships_reassignments_assignments memberships_reassignments_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_assignments
    ADD CONSTRAINT memberships_reassignments_assignments_pkey PRIMARY KEY (id);


--
-- Name: memberships_reassignments_scaffolding_completely_concrete_tangi memberships_reassignments_scaffolding_completely_concrete__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_scaffolding_completely_concrete_tangi
    ADD CONSTRAINT memberships_reassignments_scaffolding_completely_concrete__pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: oauth_stripe_accounts oauth_stripe_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_stripe_accounts
    ADD CONSTRAINT oauth_stripe_accounts_pkey PRIMARY KEY (id);


--
-- Name: postal_addresses postal_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postal_addresses
    ADD CONSTRAINT postal_addresses_pkey PRIMARY KEY (id);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collaborators scaffolding_absolutely_abstract_creative_concepts_collabor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts_collaborators
    ADD CONSTRAINT scaffolding_absolutely_abstract_creative_concepts_collabor_pkey PRIMARY KEY (id);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts scaffolding_absolutely_abstract_creative_concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts
    ADD CONSTRAINT scaffolding_absolutely_abstract_creative_concepts_pkey PRIMARY KEY (id);


--
-- Name: scaffolding_completely_concrete_tangible_things_assignments scaffolding_completely_concrete_tangible_things_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things_assignments
    ADD CONSTRAINT scaffolding_completely_concrete_tangible_things_assignment_pkey PRIMARY KEY (id);


--
-- Name: scaffolding_completely_concrete_tangible_things scaffolding_completely_concrete_tangible_things_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things
    ADD CONSTRAINT scaffolding_completely_concrete_tangible_things_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webhooks_incoming_bullet_train_webhooks webhooks_incoming_bullet_train_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_incoming_bullet_train_webhooks
    ADD CONSTRAINT webhooks_incoming_bullet_train_webhooks_pkey PRIMARY KEY (id);


--
-- Name: webhooks_incoming_oauth_stripe_account_webhooks webhooks_incoming_oauth_stripe_account_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_incoming_oauth_stripe_account_webhooks
    ADD CONSTRAINT webhooks_incoming_oauth_stripe_account_webhooks_pkey PRIMARY KEY (id);


--
-- Name: webhooks_outgoing_deliveries webhooks_outgoing_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_deliveries
    ADD CONSTRAINT webhooks_outgoing_deliveries_pkey PRIMARY KEY (id);


--
-- Name: webhooks_outgoing_delivery_attempts webhooks_outgoing_delivery_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_delivery_attempts
    ADD CONSTRAINT webhooks_outgoing_delivery_attempts_pkey PRIMARY KEY (id);


--
-- Name: webhooks_outgoing_endpoints webhooks_outgoing_endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_endpoints
    ADD CONSTRAINT webhooks_outgoing_endpoints_pkey PRIMARY KEY (id);


--
-- Name: webhooks_outgoing_events webhooks_outgoing_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_events
    ADD CONSTRAINT webhooks_outgoing_events_pkey PRIMARY KEY (id);


--
-- Name: index_absolutely_abstract_creative_concepts_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_absolutely_abstract_creative_concepts_on_team_id ON public.scaffolding_absolutely_abstract_creative_concepts USING btree (team_id);


--
-- Name: index_action_mailbox_inbound_emails_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_mailbox_inbound_emails_uniqueness ON public.action_mailbox_inbound_emails USING btree (message_id, message_checksum);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_assignments_on_tangible_things_reassignment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assignments_on_tangible_things_reassignment_id ON public.memberships_reassignments_assignments USING btree (scaffolding_completely_concrete_tangible_things_reassignments_i);


--
-- Name: index_companies_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_team_id ON public.companies USING btree (team_id);


--
-- Name: index_contacts_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contacts_on_company_id ON public.contacts USING btree (company_id);


--
-- Name: index_creative_concepts_collaborators_on_creative_concept_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_creative_concepts_collaborators_on_creative_concept_id ON public.scaffolding_absolutely_abstract_creative_concepts_collaborators USING btree (creative_concept_id);


--
-- Name: index_creative_concepts_collaborators_on_membership_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_creative_concepts_collaborators_on_membership_id ON public.scaffolding_absolutely_abstract_creative_concepts_collaborators USING btree (membership_id);


--
-- Name: index_integrations_stripe_installations_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_integrations_stripe_installations_on_team_id ON public.integrations_stripe_installations USING btree (team_id);


--
-- Name: index_invitations_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_invitations_on_team_id ON public.invitations USING btree (team_id);


--
-- Name: index_ledger_accounts_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_accounts_on_company_id ON public.ledger_accounts USING btree (company_id);


--
-- Name: index_ledger_entries_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_entries_on_company_id ON public.ledger_entries USING btree (company_id);


--
-- Name: index_ledger_entries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_entries_on_user_id ON public.ledger_entries USING btree (user_id);


--
-- Name: index_ledger_entry_details_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_entry_details_on_company_id ON public.ledger_entry_details USING btree (company_id);


--
-- Name: index_ledger_entry_details_on_ledger_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_entry_details_on_ledger_account_id ON public.ledger_entry_details USING btree (ledger_account_id);


--
-- Name: index_ledger_entry_details_on_ledger_entry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ledger_entry_details_on_ledger_entry_id ON public.ledger_entry_details USING btree (ledger_entry_id);


--
-- Name: index_memberships_on_added_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_on_added_by_id ON public.memberships USING btree (added_by_id);


--
-- Name: index_memberships_on_invitation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_on_invitation_id ON public.memberships USING btree (invitation_id);


--
-- Name: index_memberships_on_platform_agent_of_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_on_platform_agent_of_id ON public.memberships USING btree (platform_agent_of_id);


--
-- Name: index_memberships_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_on_team_id ON public.memberships USING btree (team_id);


--
-- Name: index_memberships_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_on_user_id ON public.memberships USING btree (user_id);


--
-- Name: index_memberships_reassignments_assignments_on_membership_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_memberships_reassignments_assignments_on_membership_id ON public.memberships_reassignments_assignments USING btree (membership_id);


--
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- Name: index_oauth_access_grants_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_grants_on_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_applications_on_team_id ON public.oauth_applications USING btree (team_id);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_oauth_stripe_accounts_on_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_stripe_accounts_on_uid ON public.oauth_stripe_accounts USING btree (uid);


--
-- Name: index_oauth_stripe_accounts_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_stripe_accounts_on_user_id ON public.oauth_stripe_accounts USING btree (user_id);


--
-- Name: index_postal_addresses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_postal_addresses_on_company_id ON public.postal_addresses USING btree (company_id);


--
-- Name: index_stripe_installations_on_stripe_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_stripe_installations_on_stripe_account_id ON public.integrations_stripe_installations USING btree (oauth_stripe_account_id);


--
-- Name: index_stripe_webhooks_on_stripe_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_stripe_webhooks_on_stripe_account_id ON public.webhooks_incoming_oauth_stripe_account_webhooks USING btree (oauth_stripe_account_id);


--
-- Name: index_tangible_things_assignments_on_membership_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tangible_things_assignments_on_membership_id ON public.scaffolding_completely_concrete_tangible_things_assignments USING btree (membership_id);


--
-- Name: index_tangible_things_assignments_on_tangible_thing_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tangible_things_assignments_on_tangible_thing_id ON public.scaffolding_completely_concrete_tangible_things_assignments USING btree (tangible_thing_id);


--
-- Name: index_tangible_things_on_creative_concept_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tangible_things_on_creative_concept_id ON public.scaffolding_completely_concrete_tangible_things USING btree (absolutely_abstract_creative_concept_id);


--
-- Name: index_tangible_things_reassignments_on_membership_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tangible_things_reassignments_on_membership_id ON public.memberships_reassignments_scaffolding_completely_concrete_tangi USING btree (membership_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_platform_agent_of_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_platform_agent_of_id ON public.users USING btree (platform_agent_of_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_webhooks_outgoing_endpoints_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_webhooks_outgoing_endpoints_on_team_id ON public.webhooks_outgoing_endpoints USING btree (team_id);


--
-- Name: index_webhooks_outgoing_events_on_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_webhooks_outgoing_events_on_team_id ON public.webhooks_outgoing_events USING btree (team_id);


--
-- Name: integrations_stripe_installations fk_rails_034a713889; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_stripe_installations
    ADD CONSTRAINT fk_rails_034a713889 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collaborators fk_rails_0500ac653b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts_collaborators
    ADD CONSTRAINT fk_rails_0500ac653b FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- Name: ledger_accounts fk_rails_0f10f7de5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_accounts
    ADD CONSTRAINT fk_rails_0f10f7de5b FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: scaffolding_completely_concrete_tangible_things_assignments fk_rails_23aed48b72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things_assignments
    ADD CONSTRAINT fk_rails_23aed48b72 FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- Name: ledger_entry_details fk_rails_29a6a5bfce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entry_details
    ADD CONSTRAINT fk_rails_29a6a5bfce FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: invitations fk_rails_37fb5b9295; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk_rails_37fb5b9295 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: contacts fk_rails_42b4583938; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk_rails_42b4583938 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: webhooks_outgoing_events fk_rails_460d0ae714; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_events
    ADD CONSTRAINT fk_rails_460d0ae714 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts fk_rails_46101b644b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts
    ADD CONSTRAINT fk_rails_46101b644b FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: webhooks_outgoing_endpoints fk_rails_46230a5fb4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_outgoing_endpoints
    ADD CONSTRAINT fk_rails_46230a5fb4 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: scaffolding_completely_concrete_tangible_things fk_rails_5edba33aa3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things
    ADD CONSTRAINT fk_rails_5edba33aa3 FOREIGN KEY (absolutely_abstract_creative_concept_id) REFERENCES public.scaffolding_absolutely_abstract_creative_concepts(id);


--
-- Name: memberships fk_rails_688bbf8b6a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT fk_rails_688bbf8b6a FOREIGN KEY (added_by_id) REFERENCES public.memberships(id);


--
-- Name: memberships_reassignments_scaffolding_completely_concrete_tangi fk_rails_69911f7b1b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_scaffolding_completely_concrete_tangi
    ADD CONSTRAINT fk_rails_69911f7b1b FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: oauth_stripe_accounts fk_rails_73d3f78abb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_stripe_accounts
    ADD CONSTRAINT fk_rails_73d3f78abb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: memberships fk_rails_8069b4366b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT fk_rails_8069b4366b FOREIGN KEY (platform_agent_of_id) REFERENCES public.oauth_applications(id);


--
-- Name: memberships_reassignments_assignments fk_rails_8bac3e2458; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_assignments
    ADD CONSTRAINT fk_rails_8bac3e2458 FOREIGN KEY (scaffolding_completely_concrete_tangible_things_reassignments_i) REFERENCES public.memberships_reassignments_scaffolding_completely_concrete_tangi(id);


--
-- Name: memberships fk_rails_99326fb65d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT fk_rails_99326fb65d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: scaffolding_absolutely_abstract_creative_concepts_collaborators fk_rails_a90f94c8ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_absolutely_abstract_creative_concepts_collaborators
    ADD CONSTRAINT fk_rails_a90f94c8ad FOREIGN KEY (creative_concept_id) REFERENCES public.scaffolding_absolutely_abstract_creative_concepts(id);


--
-- Name: ledger_entries fk_rails_ab31674cdd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entries
    ADD CONSTRAINT fk_rails_ab31674cdd FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: memberships fk_rails_ae2aedcfaf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT fk_rails_ae2aedcfaf FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: ledger_entries fk_rails_ae86e9b3ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entries
    ADD CONSTRAINT fk_rails_ae86e9b3ff FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: scaffolding_completely_concrete_tangible_things_assignments fk_rails_b4b9509625; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scaffolding_completely_concrete_tangible_things_assignments
    ADD CONSTRAINT fk_rails_b4b9509625 FOREIGN KEY (tangible_thing_id) REFERENCES public.scaffolding_completely_concrete_tangible_things(id);


--
-- Name: oauth_applications fk_rails_b64255fe67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT fk_rails_b64255fe67 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: ledger_entry_details fk_rails_c408308fc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entry_details
    ADD CONSTRAINT fk_rails_c408308fc7 FOREIGN KEY (ledger_account_id) REFERENCES public.ledger_accounts(id);


--
-- Name: memberships_reassignments_assignments fk_rails_e54bd0f1e4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships_reassignments_assignments
    ADD CONSTRAINT fk_rails_e54bd0f1e4 FOREIGN KEY (membership_id) REFERENCES public.memberships(id);


--
-- Name: memberships fk_rails_e7d4b6dd6c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT fk_rails_e7d4b6dd6c FOREIGN KEY (invitation_id) REFERENCES public.invitations(id);


--
-- Name: ledger_entry_details fk_rails_ee43fa2547; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger_entry_details
    ADD CONSTRAINT fk_rails_ee43fa2547 FOREIGN KEY (ledger_entry_id) REFERENCES public.ledger_entries(id);


--
-- Name: users fk_rails_f04fb64aca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f04fb64aca FOREIGN KEY (platform_agent_of_id) REFERENCES public.oauth_applications(id);


--
-- Name: companies fk_rails_f7f30b55b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_f7f30b55b8 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: postal_addresses fk_rails_fc2e671f9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postal_addresses
    ADD CONSTRAINT fk_rails_fc2e671f9f FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: integrations_stripe_installations fk_rails_ffb8313e74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations_stripe_installations
    ADD CONSTRAINT fk_rails_ffb8313e74 FOREIGN KEY (oauth_stripe_account_id) REFERENCES public.oauth_stripe_accounts(id);


--
-- PostgreSQL database dump complete
--

