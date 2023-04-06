﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "genome_scores" (
    "movieId" int   NOT NULL,
    "tagId" int   NOT NULL,
    "relevance" float   NOT NULL,
    CONSTRAINT "pk_genome_scores" PRIMARY KEY (
        "tagId"
     )
);

CREATE TABLE "genome_tags" (
    "tagId" int   NOT NULL,
    "tag" string   NOT NULL,
    CONSTRAINT "pk_genome_tags" PRIMARY KEY (
        "tagId"
     )
);

CREATE TABLE "tags" (
    "userId" int   NOT NULL,
    "movieId" int   NOT NULL,
    "tag" string   NOT NULL,
    "timestamp" int   NOT NULL,
    CONSTRAINT "pk_tags" PRIMARY KEY (
        "movieId","tag"
     )
);

CREATE TABLE "ratings" (
    "userId" int   NOT NULL,
    "movieId" int   NOT NULL,
    "rating" money   NOT NULL,
    "timestamp" int   NOT NULL
);

CREATE TABLE "movies" (
    "movieId" int   NOT NULL,
    "title" string   NOT NULL,
    "genres" string   NOT NULL,
    CONSTRAINT "pk_movies" PRIMARY KEY (
        "movieId"
     ),
    CONSTRAINT "uc_movies_title" UNIQUE (
        "title"
    )
);

CREATE TABLE "links" (
    "movieId" int   NOT NULL,
    "imdbId" int   NOT NULL,
    "tmdbId" int   NOT NULL,
    CONSTRAINT "pk_links" PRIMARY KEY (
        "movieId"
     )
);

CREATE TABLE "movies_metadata" (
    "adult" boolean   NOT NULL,
    "belongs_to_collection" string   NOT NULL,
    "budget" int   NOT NULL,
    "genres" string   NOT NULL,
    "homepage" string   NOT NULL,
    "id" int   NOT NULL,
    "imdb_id" int   NOT NULL,
    "original_language" string   NOT NULL,
    "original_title" string   NOT NULL,
    "overview" string   NOT NULL,
    "popularity" float   NOT NULL,
    "poster_path" string   NOT NULL,
    "production_companies" string   NOT NULL,
    "production_countries" string   NOT NULL,
    "release_date" date   NOT NULL,
    "revenue" int   NOT NULL,
    "runtime" int   NOT NULL,
    "spoken_language" string   NOT NULL,
    "status" string   NOT NULL,
    "tagline" string   NOT NULL,
    "title" string   NOT NULL,
    "video" boolean   NOT NULL,
    "vote_average" float   NOT NULL,
    "vote_count" int   NOT NULL,
    CONSTRAINT "pk_movies_metadata" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "keywords" (
    "id" int   NOT NULL,
    "keywords" string   NOT NULL,
    CONSTRAINT "pk_keywords" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "genome_scores" ADD CONSTRAINT "fk_genome_scores_movieId" FOREIGN KEY("movieId")
REFERENCES "movies" ("movieId");

ALTER TABLE "genome_tags" ADD CONSTRAINT "fk_genome_tags_tagId" FOREIGN KEY("tagId")
REFERENCES "genome_scores" ("tagId");

ALTER TABLE "tags" ADD CONSTRAINT "fk_tags_movieId" FOREIGN KEY("movieId")
REFERENCES "movies" ("movieId");

ALTER TABLE "ratings" ADD CONSTRAINT "fk_ratings_movieId" FOREIGN KEY("movieId")
REFERENCES "movies" ("movieId");

ALTER TABLE "links" ADD CONSTRAINT "fk_links_movieId" FOREIGN KEY("movieId")
REFERENCES "movies" ("movieId");

ALTER TABLE "links" ADD CONSTRAINT "fk_links_imdbId" FOREIGN KEY("imdbId")
REFERENCES "movies_metadata" ("imdb_id");

ALTER TABLE "keywords" ADD CONSTRAINT "fk_keywords_id" FOREIGN KEY("id")
REFERENCES "movies_metadata" ("id");
