user = User.create(email:            'vinay@kreatio.com',
            password:                'vinay@123',
            password_confirmation:   'vinay@123',
            first:                   'Vinay',
            last:                    'Gupta')
user.create_secret_code(secret_key: SecretCode.new.generate_secret_code)


user = User.create(email:            'foo@foo.com',
            password:                'foobaz@123',
            password_confirmation:   'foobaz@123',
            first:                   'Foo',
            last:                    'Foo Foo')
user.create_secret_code(secret_key: SecretCode.new.generate_secret_code)


user = User.create(email:            'bar@bar.com',
            password:                'barbaz@123',
            password_confirmation:   'barbaz@123',
            first:                   'Bar',
            last:                    'Bar Bar')
user.create_secret_code(secret_key: SecretCode.new.generate_secret_code)


user = User.create(email:            'admin@admin.com',
            password:                'admin@123',
            password_confirmation:   'admin@123',
            first:                   'GroupTable',
            last:                    'GroupTable Admin')
user.create_secret_code(secret_key: SecretCode.new.generate_secret_code)
