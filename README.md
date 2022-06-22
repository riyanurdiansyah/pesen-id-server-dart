A Server app built using Dart

# Running the sample

## AUTH
#### LOGIN

- #### Response

```
{
    "status": 200,
    "message": "Success",
    "data": {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjU1ODY0OTY2LCJzdWIiOiI3M2ZkMTc4Yi0yOWE5LTQ2OWQtYTlhZS0xZmZjNjVjZGIyYmYiLCJlbWFpbCI6InJpeWFucy5hcmthZGVtaUBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQifQ.wphUieNE6MdzywUDtwCcHypWrNQCDCi6529BhCb1ydU",
        "expires_in": 3600,
        "refresh_token": "cF7NkOs-nJv2KeJjkRabgQ",
        "token_type": "bearer",
        "provider_token": null,
        "user": {
            "id": "73fd178b-29a9-469d-a9ae-1ffc65cdb2bf",
            "app_metadata": {
                "provider": "email",
                "providers": [
                    "email"
                ]
            },
            "user_metadata": {},
            "aud": "authenticated",
            "email": "riyans.arkademi@gmail.com",
            "phone": "",
            "created_at": "2022-06-21T14:28:54.327786Z",
            "confirmed_at": "2022-06-21T14:28:54.332112Z",
            "email_confirmed_at": "2022-06-21T14:28:54.332112Z",
            "phone_confirmed_at": null,
            "last_sign_in_at": "2022-06-22T01:29:26.847130846Z",
            "role": "authenticated",
            "updated_at": "2022-06-22T01:29:26.848466Z"
        }
    }
}
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```
