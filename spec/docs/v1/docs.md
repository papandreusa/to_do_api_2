

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
              "name": "quisquam"
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
                  "name": "quisquam"
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

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {"name":null}

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
                    "name": "consectetur"
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
                    "name": "illum"
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
                  "name": "laboriosam"
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
              "name": "corporis"
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
                  "name": "corporis"
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

+ Request puts project with invalid id
**PUT**&nbsp;&nbsp;`/api/v1/projects/invalid_id`

    + Headers

            Content-Type: application/x-www-form-urlencoded
            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

    + Body

            {"name":"cum"}

+ Response 404

    + Headers

            Content-Type: text/html; charset=utf-8
