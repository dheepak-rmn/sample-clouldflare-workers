CREATE TABLE USERS (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    password TEXT,
    unique_user_id text,
    auth_provider TEXT
);

CREATE TABLE SUBSCRIPTION_PLANS (
    id SERIAL PRIMARY KEY,
    unique_subscription_id text,
    name TEXT,
    price REAL,
    billing_cycle TEXT,
    trial_period_in_days INTEGER
);

CREATE TABLE SUBSCRIPTION_PLAN_CODES (
    id SERIAL PRIMARY KEY,
    subscription_code text,
    is_consumed BOOLEAN,
    is_revoked BOOLEAN,
    subscription_id INTEGER,
    FOREIGN KEY (subscription_id) REFERENCES SUBSCRIPTION_PLANS (id)
);

CREATE TABLE USER_SUBSCRPTIONS (
    id SERIAL PRIMARY KEY,
    subscription_id INTEGER,
    status TEXT,
    start_date DATE,
    expiry_date DATE,
    user_id INTEGER,
    subscription_code_id INTEGER,
    FOREIGN KEY (subscription_code_id) REFERENCES SUBSCRIPTION_PLAN_CODES (id),
    FOREIGN KEY (user_id) REFERENCES USERS (id)
);

CREATE TABLE USER_PAYMENTS (
    id SERIAL PRIMARY KEY,
    payment_order_id TEXT,
    status TEXT,
    payment_date DATE,
    payment_amount DATE,
    payment_type TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES USERS (id)
);

CREATE TABLE USER_SUBSCRIPTION_PAYMENTS (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    payment_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES USERS (id),
    FOREIGN KEY (payment_id) REFERENCES USER_PAYMENTS (id)
);

create table PERMISSIONS (
    id SERIAL PRIMARY KEY,
    permission_name TEXT,
    permission_code TEXT
);

create table SUBSCRIPTION_PERMISSIONS (
    id SERIAL PRIMARY KEY,
    subscription_id INTEGER,
    permission_id INTEGER,
    FOREIGN KEY (subscription_id) REFERENCES SUBSCRIPTION_PLANS (id),
    FOREIGN KEY (permission_id) REFERENCES PERMISSIONS (id)
);

create table THERAPISTS (
	id SERIAL PRIMARY KEY,
	user_id INTEGER,
	FOREIGN KEY (user_id) REFERENCES USERS (id)
)

create table CUSTOMERS (
	id SERIAL PRIMARY KEY,
	user_id INTEGER,
	FOREIGN KEY (user_id) REFERENCES USERS (id)
)

create table NEEDS (
	id SERIAL PRIMARY KEY,
	description text
);

create table CUSTOMER_NEEDS (
	id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	need_id INTEGER,
	importance INTEGER,
	priority INTEGER,
	FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (id),
	FOREIGN KEY (need_id) REFERENCES NEEDS (id)
);
