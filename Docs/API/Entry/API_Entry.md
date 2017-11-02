# List Entry

1. [Create](#create)
2. [Edit](#edit)
3. [Delete](#delete)
4. [Show](#show)

## Create
##### Request
```
POST ./api/lists/:LIST_IDENTIFIER/entries
```

##### Payload
```
{
  "name": "ENTRY_NAME"
  "status": "ENTRY_STATUS"
}
```

##### Params
Name | Type | Required | Description
------------ | -------------
name | string | no | Name used to recognize lists. Will be set to `unknown` if not passed.
status| string | no | Status used to determine if entry was fulfilled. Available options: `done`, `pending`

##### Response
```
{
  "type": "list",
  "identifier": "LIST_IDENTIFIER",
  "created_at": "2017-10-19T15:19:21+00:00",
  "name": "LIST_NAME",  
  "entries": [
    {
      "type": "entry",
      "identifier": "ENTRY_IDENTIFIER"
      "created_at": "2017-10-19T15:19:21+00:00",
      "name": "ENTRY_NAME"
      "status": "ENTRY_STATUS"
    }, {
    ...
    }
  ]
}
```

## Edit
##### Request
```
PUT ./api/entries/:ENTRY_IDENTIFIER
```

##### Payload
```
{
  "name": "ENTRY_NAME"
  "status": "ENTRY_STATUS"
}
```

##### Params
Name | Type | Required | Description
------------ | -------------
name | string | no | Name used to recognize lists. Will be set to `unknown` if not passed.
status| string | no | Status used to determine if entry was fulfilled. Available options: `done`, `pending`

#### Response
```
{
  "type": "entry",
  "identifier": "ENTRY_IDENTIFIER"
  "created_at": "2017-10-19T15:19:21+00:00",
  "name": "ENTRY_NAME"
  "status": "ENTRY_STATUS"
}
```

## Delete
##### Request
```
DELETE ./api/entries/:ENTRY_IDENTIFIER
```

##### Payload
*None*

##### Params
*None*

#### Response
```
200 ok
```

## Show
##### Request
```
GET ./api/entries/:ENTRY_IDENTIFIER
```

##### Payload
*None*

##### Params
*None*

#### Response
```
{
  "type": "entry",
  "identifier": "ENTRY_IDENTIFIER"
  "created_at": "2017-10-19T15:19:21+00:00",
  "name": "ENTRY_NAME"
  "status": "ENTRY_STATUS"
}
```
