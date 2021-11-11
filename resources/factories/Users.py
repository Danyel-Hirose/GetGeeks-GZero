from faker import Faker
fake = Faker('pt_BR')

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

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
        'short_desc': {
            'name': "Peter",
            'lastname': "Parker",
            'email': "Parker@email.com",
            'password': '123456',
            'geek_profile' : {
                'whatsapp': "12123456789",
                'description': "Formato o seu PC",
                'printer_repair': 'Sim',
                'type_work': 'Remoto',
                'cost': '175',
            }

        },
        'long_desc': {
            'name': "Peter",
            'lastname': "Parker",
            'email': "Parker@email.com",
            'password': '123456',
            'geek_profile' : {
                'whatsapp': "12123456789",
                'description': "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas",
                'printer_repair': 'Sim',
                'type_work': 'Remoto',
                'cost': '175',
            }
        }
    }

    return data[target]