create table carts
(
    id         bigint unsigned auto_increment
        primary key,
    product_id bigint    not null,
    user_id    bigint    not null,
    created_at timestamp null,
    updated_at timestamp null
)
    collate = utf8mb4_unicode_ci;

create table categories
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255) not null,
    slug        varchar(255) not null,
    description text         null,
    deleted_at  timestamp    null,
    created_at  timestamp    null,
    updated_at  timestamp    null,
    constraint categories_name_unique
        unique (name),
    constraint categories_slug_unique
        unique (slug)
)
    collate = utf8mb4_unicode_ci;

create table children_rooms
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255)   not null,
    image       text           not null,
    description text           not null,
    price       decimal(10, 2) not null,
    stock       int            not null,
    created_at  timestamp      null,
    updated_at  timestamp      null
)
    collate = utf8mb4_unicode_ci;

create table decorations
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255)  not null,
    image       varchar(255)  not null,
    description text          not null,
    price       decimal(8, 2) not null,
    stock       int           not null,
    created_at  timestamp     null,
    updated_at  timestamp     null
)
    collate = utf8mb4_unicode_ci;

create table deliveries
(
    id         bigint unsigned auto_increment
        primary key,
    user_id    bigint unsigned                not null,
    address    varchar(255)                   not null,
    city       varchar(255)                   not null,
    phone      varchar(255)                   not null,
    status     varchar(255) default 'Pending' not null,
    created_at timestamp                      null,
    updated_at timestamp                      null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table living_room
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255)  not null,
    image       varchar(255)  not null,
    description text          not null,
    price       decimal(8, 2) not null,
    stock       int default 0 not null,
    created_at  timestamp     null,
    updated_at  timestamp     null
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table password_reset_tokens
(
    email      varchar(255) not null
        primary key,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table personal_access_tokens
(
    id             bigint unsigned auto_increment
        primary key,
    tokenable_type varchar(255)    not null,
    tokenable_id   bigint unsigned not null,
    name           varchar(255)    not null,
    token          varchar(64)     not null,
    abilities      text            null,
    last_used_at   timestamp       null,
    expires_at     timestamp       null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint personal_access_tokens_token_unique
        unique (token)
)
    collate = utf8mb4_unicode_ci;

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on personal_access_tokens (tokenable_type, tokenable_id);

create table product_galleries
(
    id          bigint unsigned auto_increment
        primary key,
    product_id  bigint               not null,
    url         varchar(255)         not null,
    is_featured tinyint(1) default 0 not null,
    deleted_at  timestamp            null,
    created_at  timestamp            null,
    updated_at  timestamp            null
)
    collate = utf8mb4_unicode_ci;

create table products
(
    id          bigint unsigned auto_increment
        primary key,
    name        varchar(255)    not null,
    price       bigint          not null,
    description longtext        not null,
    image_url   longtext        null,
    slug        varchar(255)    not null,
    category_id bigint unsigned null,
    deleted_at  timestamp       null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    constraint products_slug_unique
        unique (slug),
    constraint products_category_id_foreign
        foreign key (category_id) references categories (id)
            on delete set null
)
    collate = utf8mb4_unicode_ci;

create table rewards
(
    id              bigint unsigned auto_increment
        primary key,
    name            varchar(255)                  not null,
    description     text                          not null,
    image_url       varchar(255)                  not null,
    points_required int                           not null,
    status          varchar(255) default 'Active' not null,
    created_at      timestamp                     null,
    updated_at      timestamp                     null
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       longtext        not null,
    last_activity int             not null
)
    collate = utf8mb4_unicode_ci;

create index sessions_last_activity_index
    on sessions (last_activity);

create index sessions_user_id_index
    on sessions (user_id);

create table showcases
(
    id          bigint unsigned auto_increment
        primary key,
    title       varchar(255)                                 not null,
    description text                                         not null,
    image_url   varchar(255)                                 not null,
    status      enum ('Active', 'Inactive') default 'Active' not null,
    created_at  timestamp                                    null,
    updated_at  timestamp                                    null
)
    collate = utf8mb4_unicode_ci;

create table tags
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    slug       varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null,
    constraint tags_name_unique
        unique (name),
    constraint tags_slug_unique
        unique (slug)
)
    collate = utf8mb4_unicode_ci;

create table product_tags
(
    id         bigint unsigned auto_increment
        primary key,
    product_id bigint unsigned not null,
    tag_id     bigint unsigned not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint product_tags_product_id_foreign
        foreign key (product_id) references products (id)
            on delete cascade,
    constraint product_tags_tag_id_foreign
        foreign key (tag_id) references tags (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table transaction_items
(
    id             bigint unsigned auto_increment
        primary key,
    user_id        bigint    not null,
    product_id     bigint    not null,
    transaction_id bigint    not null,
    created_at     timestamp null,
    updated_at     timestamp null
)
    collate = utf8mb4_unicode_ci;

create table transactions
(
    id          bigint unsigned auto_increment
        primary key,
    user_id     bigint                          not null,
    name        varchar(255)                    null,
    email       varchar(255)                    null,
    address     text                            null,
    phone       varchar(255)                    null,
    courier     varchar(255)                    null,
    payment     varchar(255) default 'MIDTRANS' not null,
    payment_url varchar(255)                    null,
    total_price bigint       default 0          not null,
    status      varchar(255) default 'PENDING'  not null,
    deleted_at  timestamp                       null,
    created_at  timestamp                       null,
    updated_at  timestamp                       null
)
    collate = utf8mb4_unicode_ci;

create table users
(
    id                        bigint unsigned auto_increment
        primary key,
    name                      varchar(255)                not null,
    email                     varchar(255)                not null,
    roles                     varchar(255) default 'USER' not null,
    email_verified_at         timestamp                   null,
    password                  varchar(255)                not null,
    two_factor_secret         text                        null,
    two_factor_recovery_codes text                        null,
    two_factor_confirmed_at   timestamp                   null,
    remember_token            varchar(100)                null,
    current_team_id           bigint unsigned             null,
    profile_photo_path        varchar(2048)               null,
    created_at                timestamp                   null,
    updated_at                timestamp                   null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;


