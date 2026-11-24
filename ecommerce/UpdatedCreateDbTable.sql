-- ============================================
-- CREATE DATABASE (run separately in psql)
-- ============================================
-- CREATE DATABASE ecommerce;

-- ============================================
-- DROP EXISTING TABLES (for clean setup)
-- ============================================

DROP TABLE IF EXISTS public.sale_order_item CASCADE;
DROP TABLE IF EXISTS public.sale_order CASCADE;
DROP TABLE IF EXISTS public.member CASCADE;
DROP TABLE IF EXISTS public.member_role CASCADE;
DROP TABLE IF EXISTS public.product CASCADE;

-- ============================================
-- CREATE TABLES (Pre-existing schema)
-- ============================================

CREATE TABLE public.member_role (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(25)
);

CREATE TABLE public.member (
    id SERIAL PRIMARY KEY,
    username CHARACTER VARYING(50) NOT NULL UNIQUE,
    email CHARACTER VARYING(50) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    password CHARACTER VARYING(255) NOT NULL,
    role INTEGER NOT NULL,
    gender CHARACTER(1) NOT NULL,
    CONSTRAINT fk_member_role_id FOREIGN KEY (role) REFERENCES public.member_role(id)
);

CREATE TABLE public.product (
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(255),
    description TEXT,
    unit_price NUMERIC NOT NULL,
    stock_quantity NUMERIC DEFAULT 0 NOT NULL,
    country CHARACTER VARYING(100),
    product_type CHARACTER VARYING(50),
    image_url CHARACTER VARYING(255) DEFAULT '/images/product.png',
    manufactured_on TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE public.sale_order (
    id SERIAL PRIMARY KEY,
    member_id INTEGER,
    order_datetime TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    status CHARACTER VARYING(10),
    CONSTRAINT fk_sale_order_member FOREIGN KEY (member_id) REFERENCES public.member(id)
);

CREATE TABLE public.sale_order_item (
    id SERIAL PRIMARY KEY,
    sale_order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity NUMERIC NOT NULL,
    CONSTRAINT fk_sale_order_item_sale_order FOREIGN KEY (sale_order_id) REFERENCES public.sale_order(id),
    CONSTRAINT fk_sale_order_item_product FOREIGN KEY (product_id) REFERENCES public.product(id)
);

-- ===============================================
-- CREATE Review and Comment Tables (Newly added)
-- ===============================================

-- TODO: Not checked yet (make separate function to check) member that posted the review cannot make top level comments

CREATE TABLE public.review (
	id SERIAL PRIMARY KEY, 
	member_id INT NOT NULL, 
	product_id INT NOT NULL, 
	rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5), 
	text TEXT NOT NULL, 
	last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES public.member(id), 

CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(id), 
	
-- Checks that 1 member only has 1 review for 1 product
UNIQUE (member_id, product_id) 
);

CREATE TABLE public.comment (
	id SERIAL PRIMARY KEY, 
	review_id INT NOT NULL, 
	parent_comment_id INT, -- Can be NULL (Top level comment)
	member_id INT NOT NULL, 
	text TEXT NOT NULL, 

CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES public.member(id), 
	
-- If review is deleted, comments also deleted
CONSTRAINT fk_review_id FOREIGN KEY (review_id) REFERENCES public.review(id) ON DELETE CASCADE, 

	-- Checks that parent comment belongs to the same review 
-- If parent comment is deleted comments also deleted
CONSTRAINT fk_parent_comment FOREIGN KEY (parent_comment_id, review_id) REFERENCES public.comment(id, review_id) ON DELETE CASCADE, 

-- Needed for the composite foreign key
CONSTRAINT unique_comment_review UNIQUE (id, review_id) );

