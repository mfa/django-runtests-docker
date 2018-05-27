DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'db',  # docker container for postgres
        'NAME': 'default',
        'USER': 'postgres',
    },
    'other': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'db',  # docker container for postgres
        'NAME': 'other',
        'USER': 'postgres',
    }
}

SECRET_KEY = "django_tests_secret_key"

# Use a fast hasher to speed up tests.
PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
]
