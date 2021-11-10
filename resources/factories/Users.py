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

def factory_user_be_geek():
    
    return {
        'name': "Kim",
        'lastname': "Datcom",
        'email': "kim_dot@email.com",
        'password': '123456',
        'geek_profile' : {
                'whatsapp': "12123456789",
                'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nisi nibh, porttitor sed sagittis suscipit, sollicitudin id quam. Cras tempus quis tortor molestie mollis. Morbi interdum lectus sit amet condimentum sagittis.",
                'printer_repair': 'Sim',
                'type_work': 'Remoto',
                'cost': '175',
        }
    }
     