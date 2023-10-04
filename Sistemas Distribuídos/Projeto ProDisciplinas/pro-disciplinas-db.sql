CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	"profile" enum NOT NULL,
	"login" VARCHAR(255) UNIQUE,
	"siape_professor" integer UNIQUE,
	"course_id" integer,
	"institute" VARCHAR(255),
	"password" VARCHAR(255) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.password_reset_tokens" (
	"email" VARCHAR(255) NOT NULL,
	"token" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP,
	CONSTRAINT "password_reset_tokens_pk" PRIMARY KEY ("email")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.failed_jobs" (
	"id" serial NOT NULL,
	"uuid" VARCHAR(255) NOT NULL UNIQUE,
	"connection" TEXT NOT NULL,
	"queue" TEXT NOT NULL,
	"payload" longtext NOT NULL,
	"exception" longtext NOT NULL,
	"failed_at" TIMESTAMP NOT NULL,
	CONSTRAINT "failed_jobs_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.personal_access_tokens" (
	"id" serial NOT NULL,
	"tokenable" varchar NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"token" VARCHAR(64) NOT NULL UNIQUE,
	"abilities" TEXT,
	"last_used_at" TIMESTAMP,
	"expires_at" TIMESTAMP,
	CONSTRAINT "personal_access_tokens_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.turmas" (
	"id" serial NOT NULL,
	"course_id" integer NOT NULL,
	"admission_year" smallint NOT NULL,
	CONSTRAINT "turmas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.periods" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"start_request" DATE NOT NULL,
	"end_request" DATE NOT NULL,
	"start_indication" DATE NOT NULL,
	"end_indication" DATE NOT NULL,
	"start_accept" DATE NOT NULL,
	"end_accept" DATE NOT NULL,
	CONSTRAINT "periods_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pre_offers" (
	"id" serial NOT NULL,
	"date" DATE NOT NULL,
	"shift" enum NOT NULL,
	"formatType" enum NOT NULL,
	"siape_coordenador" VARCHAR(255) NOT NULL,
	"this_is_pro_discipline" BOOLEAN NOT NULL,
	"period_id" integer NOT NULL,
	"turma_id" integer NOT NULL,
	CONSTRAINT "pre_offers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.indications" (
	"id" serial NOT NULL,
	"siape_professor" integer NOT NULL,
	"confirmed" BOOLEAN NOT NULL DEFAULT 'false',
	"accepted" BOOLEAN NOT NULL DEFAULT 'false',
	"pre_offer_id" bigint NOT NULL,
	CONSTRAINT "indications_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.forget_password" (
	"id" serial NOT NULL,
	"code" VARCHAR(255) NOT NULL,
	"user_id" bigint NOT NULL,
	"expire_in" TIMESTAMP NOT NULL,
	"token_session" VARCHAR(255),
	CONSTRAINT "forget_password_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "pre_offers" ADD CONSTRAINT "pre_offers_fk0" FOREIGN KEY ("siape_coordenador") REFERENCES "users"("siape_professor");
ALTER TABLE "pre_offers" ADD CONSTRAINT "pre_offers_fk1" FOREIGN KEY ("period_id") REFERENCES "periods"("id");
ALTER TABLE "pre_offers" ADD CONSTRAINT "pre_offers_fk2" FOREIGN KEY ("turma_id") REFERENCES "turmas"("id");

ALTER TABLE "indications" ADD CONSTRAINT "indications_fk0" FOREIGN KEY ("siape_professor") REFERENCES "users"("siape_professor");
ALTER TABLE "indications" ADD CONSTRAINT "indications_fk1" FOREIGN KEY ("pre_offer_id") REFERENCES "pre_offers"("id");

ALTER TABLE "forget_password" ADD CONSTRAINT "forget_password_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");




** MARKUP

users {
	id integer pk increments
	name string
	email string unique
	profile enum
	login string null unique
	siape_professor integer null unique
	course_id integer null
	institute string null
	password string
}

password_reset_tokens {
	email string pk
	token string
	created_at timestamp null
}

failed_jobs {
	id integer pk increments
	uuid string unique
	connection text
	queue text
	payload longtext
	exception longtext
	failed_at timestamp
}

personal_access_tokens {
	id integer pk increments
	tokenable varchar
	name string
	token string(64) unique
	abilities text null
	last_used_at timestamp null
	expires_at timestamp null
}

turmas {
	id integer pk increments
	course_id integer
	admission_year smallint
}

periods {
	id integer pk increments
	name string
	start_request date
	end_request date
	start_indication date
	end_indication date
	start_accept date
	end_accept date
}

pre_offers {
	id integer pk increments
	date date
	shift enum
	formatType enum
	siape_coordenador string > users.siape_professor
	this_is_pro_discipline boolean
	period_id integer > periods.id
	turma_id integer > turmas.id
}

indications {
	id integer pk increments
	siape_professor integer > users.siape_professor
	confirmed boolean def(false)
	accepted boolean def(false)
	pre_offer_id bigint > pre_offers.id
}

forget_password {
	id integer pk increments
	code string
	user_id bigint > users.id
	expire_in timestamp
	token_session string null
}