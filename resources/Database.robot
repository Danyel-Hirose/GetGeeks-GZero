*Settings*
Documentation           Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

# Querys para o Elephantsql
# select * from public.users;
# select * from public.geeks;
#robot -l NONE -o NONE -r NONE tasks/Delorean.robot

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     dawugilo
    ...                     dawugilo
    ...                     CmHFueD1f0iq6aIHbgcQsPhNdRGHp4G7
    ...                     lallah.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String
    ...                     DELETE from public.geeks;

    Execute SQL String
    ...                     DELETE from public.users;


Insert User
    [Arguments]     ${u}

    ${password}     get_hashed_pass     ${u}[password]

    ${q}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${password}', false)

    Execute SQL String      ${q}

Users Seed

    ${user}     factory_user   login

    Insert User  ${user}

    ${user2}     factory_user   be_geek

    Insert User  ${user2}

    ${user3}     factory_user   short_desc

    Insert User  ${user3}