# TO DO API
## [ Base URL: /api/v1 ]

# Group Authentication


## Sessions [/sesions]


### Sign In [POST /api/v1/auth/sign_in]


+ Request sign in with valid params
**POST**&nbsp;&nbsp;`/api/v1/auth/sign_in`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "username": "user11",
              "password": "r7h0KfccbM"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "KG9OLpaSsAhUsGpNFcegHLQGyIsMUI+qRz3srdqcY1saxZ3iSOPAz6IalnpQnOlorOwCsqePY7+71uSOFgBeIA==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk1NTA1NDgsInVzZXJfaWQiOjEsInVpZCI6ImJhNjA3YmI0LWU0NWEtNDI2Yi04YWQ5LTA2MWNmOWJhYmFjMyIsInJ1aWQiOiIzYjNiOTFiYy05ZjIzLTQwMzUtODlmYS1kODZiMTllNWRlY2MifQ.VdMF7VnaFfrwtw8QGmaLlRLjZZdD_Qp9fA5Yutai2ss",
              "access_expires_at": "2021-08-21T15:55:48.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzAxNTE3NDgsInVpZCI6IjNiM2I5MWJjLTlmMjMtNDAzNS04OWZhLWQ4NmIxOWU1ZGVjYyJ9.jBA0fpbysMb1gT-8lNJ4DVLJ-AHAQXQLDsGoqTpZUzQ",
              "refresh_expires_at": "2021-08-28T14:55:48.000+03:00"
            }

+ Request sign in with invalid params
**POST**&nbsp;&nbsp;`/api/v1/auth/sign_in`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "username": "user12",
              "password": "inValid pAssword"
            }

+ Response 400

    + Headers

            Content-Type: text/html; charset=utf-8

### Sign Out [DELETE /api/v1/auth/sign_out]


+ Request sign out
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sign_out`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 204

## Users [/users]


### Registration [POST /api/v1/auth]


+ Request registers user with valid params
**POST**&nbsp;&nbsp;`/api/v1/auth`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            username=user14&password=NkjR43oL&password_confirmation=NkjR43oL

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "4+LcgPbnLF8v1TmuyBc+6COMQVTiG/ebLOALmEFh1Qm6stkjmRaAiELkbUcXQt/3r5LhWP4W+EVbBwoCivrf6g==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk1NTA1NTAsInVzZXJfaWQiOjEsInVpZCI6ImU5YjYzZTVlLWIzZTYtNGM3OC04MzY0LWYyMmY5NTIxNTc1NyIsInJ1aWQiOiIwZWY4M2FiNy0yZTlmLTRkMzctYTRiYS1lNDcyYjNjMTM5MzcifQ.bYA29g9_LlM0lr_jkTElJEIkL7fRXEDmXJP3iqDPC28",
              "access_expires_at": "2021-08-21T15:55:50.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzAxNTE3NTAsInVpZCI6IjBlZjgzYWI3LTJlOWYtNGQzNy1hNGJhLWU0NzJiM2MxMzkzNyJ9.erE7yuYMxIrAPqwjy7VImKqMx8eZUxkpAmBWGWdI1_I",
              "refresh_expires_at": "2021-08-28T14:55:50.000+03:00"
            }

+ Request register user with invalid params
**POST**&nbsp;&nbsp;`/api/v1/auth`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            username=porro&password=Inv%40lid+P%40%24%24w0rd&password_confirmation=inValid+pAssword

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "password",
                  "detail": "has invalid format"
                },
                {
                  "title": "password_confirmation",
                  "detail": "must be same as password"
                }
              ]
            }

# Group Projects


## Projects [/projects]


### Create Project [POST /api/v1/projects]


+ Request posts valid params
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": "nostrum"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "project",
                "attributes": {
                  "name": "nostrum"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "/api/v1/projects/1"
                }
              }
            }

+ Request posts invalid params
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "name",
                  "detail": "must be filled"
                }
              ]
            }

### Delete Project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request deletes project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 204

+ Request deletes project with invalid id
**DELETE**&nbsp;&nbsp;`/api/v1/projects/invalid_id`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8

### Get Projects [GET /api/v1/projects]


+ Request gets index of projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "project",
                  "attributes": {
                    "name": "maxime"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1",
                        "type": "user"
                      }
                    }
                  },
                  "links": {
                    "self": "/api/v1/projects/1"
                  }
                },
                {
                  "id": "1",
                  "type": "project",
                  "attributes": {
                    "name": "quam"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1",
                        "type": "user"
                      }
                    }
                  },
                  "links": {
                    "self": "/api/v1/projects/2"
                  }
                }
              ],
              "links": {
                "self": "/api/v1/projects"
              }
            }

### Get Project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request gets project
**GET**&nbsp;&nbsp;`/api/v1/projects/1`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "project",
                "attributes": {
                  "name": "temporibus"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "/api/v1/projects/1"
                }
              }
            }

+ Request gets project with invalid id
**GET**&nbsp;&nbsp;`/api/v1/projects/invalid_id`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8

### Update Project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request puts valid params
**PUT**&nbsp;&nbsp;`/api/v1/projects/1`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": "necessitatibus"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "project",
                "attributes": {
                  "name": "necessitatibus"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1",
                      "type": "user"
                    }
                  }
                },
                "links": {
                  "self": "/api/v1/projects/1"
                }
              }
            }

+ Request posts invalid params
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": null
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "name",
                  "detail": "must be filled"
                }
              ]
            }

+ Request puts project with invalid id
**PATCH**&nbsp;&nbsp;`/api/v1/projects/invalid_id`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {"name":"voluptatum"}

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8
