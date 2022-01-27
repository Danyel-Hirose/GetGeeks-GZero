from faker import Faker
fake = Faker('pt_BR')

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return[
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_BeGeek'),
        factory_user('search_alien'),
        factory_user('search_common')
    ]

def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': '123456',
        },
        'wrong_email': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': 'email&email.com',
            'password': '123456',
        },
        'login': {
            'name': "Danyel",
            'lastname': "Miranda",
            'email': "danyel@email.com",
            'password': '123456',
        },
        'be_geek': {
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
        },
        'attempt_BeGeek': {
            'name': "Coraline",
            'lastname': "Jones",
            'email': "Coraline@email.com",
            'password': '123456',
            'geek_profile' : {
                'whatsapp': "12123456789",
                'description': "Sed ut perspiciatis omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas",
                'printer_repair': 'Sim',
                'type_work': 'Remoto',
                'cost': '175',
            }
        },
        'search_alien': {
            'name': 'Dok',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991001',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            } 
        },
        'search_common': {
            'name': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123'
        }
    }

    return data[target]