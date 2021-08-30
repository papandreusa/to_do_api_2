# TO DO API
### [ Base URL: /api/v1 ]

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
              "username": "user19",
              "password": "4zbgzJwXQ"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "d333YLLovB854WbAM/SoP2N6CuZVJsI4yloXUKan6qHLqzeuzwN3NyAXNvB+/75Xh3/Vlg8gSwg49YuSFr7Uvg==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzAzODY4NTAsInVzZXJfaWQiOjEsInVpZCI6ImYwMDY0NDliLTE3MzQtNDBhOS04NWE1LTE2MjFmMzc0NjBkNyIsInJ1aWQiOiJjMmVjZDc5Zi1lZWYxLTRhM2MtODBlNC02MWM3M2FiMjk5YmYifQ.Ggidnjsz6MGQKQs0Ah5793BlSlE0PmLlaCMVRq9AjGs",
              "access_expires_at": "2021-08-31T08:14:10.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzA5MDUyNTAsInVpZCI6ImMyZWNkNzlmLWVlZjEtNGEzYy04MGU0LTYxYzczYWIyOTliZiJ9.7ehi913Bw-t5yoxt-wEvqiIdmPwVEwNIiXdaOHqD5EQ",
              "refresh_expires_at": "2021-09-06T08:14:10.000+03:00"
            }

+ Request sign in with invalid params
**POST**&nbsp;&nbsp;`/api/v1/auth/sign_in`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "username": "user20",
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

            username=user22&password=XxOSe6P5&password_confirmation=XxOSe6P5

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "dSfSAu+LEZoemyuIROQPX4wD2STn/xQAfArNaVlBbSIyqcNTjktS8lebxXOZJxenMXoRFYKf9q58dHEtHRou3Q==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzAzODY4NTEsInVzZXJfaWQiOjEsInVpZCI6IjlhMzRmMjA4LThhMmEtNGFjOS1hODVhLTU3Nzk5YjhhNDNlMSIsInJ1aWQiOiJkNTNiZjYxMS0xODRmLTRlNTYtOTMyOC01NzdiM2ZjZGJlMzMifQ.a18T68PCb08aOBKrYDvk5eZ0F_B4iByL5nGAsFE4JNM",
              "access_expires_at": "2021-08-31T08:14:11.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzA5MDUyNTEsInVpZCI6ImQ1M2JmNjExLTE4NGYtNGU1Ni05MzI4LTU3N2IzZmNkYmUzMyJ9.FP9K-kpwxezJ7Fk54W62dVJjhJXp2mxdVDE3n05YSKw",
              "refresh_expires_at": "2021-09-06T08:14:11.000+03:00"
            }

+ Request register user with invalid params
**POST**&nbsp;&nbsp;`/api/v1/auth`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            username=alias&password=Inv%40lid+P%40%24%24w0rd&password_confirmation=inValid+pAssword

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
              "name": "porro"
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
                  "name": "porro"
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

+ Request when unauthenticated
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {"name":"iure"}

+ Response 401

    + Headers

            Content-Type: text/html; charset=utf-8

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

+ Request gets project of ohter user
**DELETE**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 403

    + Headers

            Content-Type: text/html; charset=utf-8

### Get Projects [GET /api/v1/projects]


+ Request gets index of projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Content-Type: application/json
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
                    "name": "project #5"
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
                  "id": "2",
                  "type": "project",
                  "attributes": {
                    "name": "project #6"
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
              "meta": {
                "page": {
                  "page": 1,
                  "limit": 2,
                  "pages": 1,
                  "total": 2
                }
              },
              "links": "/api/v1/projects"
            }

+ Request when unauthenticated
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 401

    + Headers

            Content-Type: text/html; charset=utf-8

### Get Project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request gets project
**GET**&nbsp;&nbsp;`/api/v1/projects/1`

    + Headers

            Content-Type: application/json
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
                  "name": "project #9"
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

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8

+ Request gets project of ohter user
**GET**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 403

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
              "name": "aperiam"
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
                  "name": "aperiam"
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

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": "quibusdam"
            }

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8

+ Request gets project of ohter user
**PATCH**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Content-Type: application/json
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {
              "name": "beatae"
            }

+ Response 403

    + Headers

            Content-Type: text/html; charset=utf-8
