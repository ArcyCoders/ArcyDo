# List

1. [Create](#create)
2. [Edit](#edit)
3. [Delete](#delete)
4. [Show](#show)

## Create
##### Request
```
POST ./api/lists
```

##### Payload
```
{
  "name": "LIST_NAME"
}
```

##### Params
Name | Type | Required | Description
------------ | -------------
name | string | no | Name used to recognize lists. Will be set to `unknown` if not passed.

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
PUT ./api/lists/:LIST_IDENTIFIER
```

##### Payload
```
{
  "name": "LIST_NAME"
}
```

#### Params
Name | Type | Required | Description
------------ | -------------
name | string | no | Updated name

##### Response
```
{
  "type": "list",
  "identifier": "LIST_IDENTIFIER",
  "created_at": "2017-10-19T15:19:21+00:00",
  "name": "LIST_UPDATED_NAME",  
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


## Delete
##### Request
```
PUT ./api/lists/:LIST_IDENTIFIER
```

##### Payload
*None*

#### Params
*None*
##### Response
```
200 OK
```

## Show
##### Request
```
GET ./api/lists/:LIST_IDENTIFIER
```

##### Payload
*None*

#### Params
*None*

##### Response
```
{
  "type": "list",
  "identifier": "LIST_IDENTIFIER",
  "created_at": "2017-10-19T15:19:21+00:00",
  "name": "LIST_NAME_NAME",  
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
