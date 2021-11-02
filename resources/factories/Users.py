from faker import Faker
fake = Faker('pt_BR')

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def factory_user_01():

    return{
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': '123456',
    }


def factory_wrong_email():

    first_name = fake.first_name()

    return {
        'name': first_name,
        'lastname': fake.last_name(),
        'email': first_name.lower() + '&email.com',
        'password': '123456',
    }

def factory_user_login():

    return {
        'name': "Danyel",
        'lastname': "Miranda",
        'email': "danyel@email.com",
        'password': '123456',
    }

     