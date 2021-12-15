
def factory_new_user():

    return {
        'name': 'Clint Barton',
        'email': 'barton@shield.com',
        'password': 'pwd123'
    }

def factory_get_user():

    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@email.com',
        'password': '123456'
    }

def factory_user_session(target):

    name = 'API'
    email = 'api@email.com'
    password = '123456'

    data = {
        'signup' : {
                'name' : name,
                'email': email,
                'password': password
        },
        'login' : {
                'email': email,
                'password': password
        }
    }

    return data[target]