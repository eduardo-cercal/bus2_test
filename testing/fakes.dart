import 'dart:convert';

import 'package:bus2_test/view_models/entities/user_entity.dart';

final Map<String, dynamic> mockJson = {
  "results": [
    {
      "gender": "male",
      "name": {"title": "Mr", "first": "Mathis", "last": "Brun"},
      "location": {
        "street": {"number": 1590, "name": "Quai Chauveau"},
        "city": "Poitiers",
        "state": "Haute-Savoie",
        "country": "France",
        "postcode": 88367,
        "coordinates": {"latitude": "-19.2091", "longitude": "-49.1722"},
        "timezone": {
          "offset": "-3:00",
          "description": "Brazil, Buenos Aires, Georgetown",
        },
      },
      "email": "mathis.brun@example.com",
      "login": {
        "uuid": "a1525b6d-b4c7-474a-8be9-831ecdf871c5",
        "username": "tinymeercat577",
        "password": "pimpdadd",
        "salt": "RsYBEqQY",
        "md5": "d361c05bf7b4242847c68ff72bce1d86",
        "sha1": "1740bd446b29a9f5cad4f1cf0d883527fa632f1a",
        "sha256":
            "4b4e039f6b6e021c1b7769d55a4f8450b1ad7edec3b94ecb841567e03b8e6e2d",
      },
      "dob": {"date": "1957-11-29T02:18:54.064Z", "age": 68},
      "registered": {"date": "2004-04-16T06:53:15.490Z", "age": 21},
      "phone": "04-89-54-08-38",
      "cell": "06-47-80-37-03",
      "id": {"name": "INSEE", "value": "1571060634218 30"},
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/89.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/89.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/89.jpg",
      },
      "nat": "FR",
    },
  ],
  "info": {
    "seed": "b1d37a907dc3f1e9",
    "results": 1,
    "page": 1,
    "version": "1.4",
  },
};

final mockUserJson = {
  "gender": "male",
  "name": {"title": "Mr", "first": "Mathis", "last": "Brun"},
  "location": {
    "street": {"number": 1590, "name": "Quai Chauveau"},
    "city": "Poitiers",
    "state": "Haute-Savoie",
    "country": "France",
    "postcode": 88367,
    "coordinates": {"latitude": "-19.2091", "longitude": "-49.1722"},
    "timezone": {
      "offset": "-3:00",
      "description": "Brazil, Buenos Aires, Georgetown",
    },
  },
  "email": "mathis.brun@example.com",
  "login": {
    "uuid": "a1525b6d-b4c7-474a-8be9-831ecdf871c5",
    "username": "tinymeercat577",
    "password": "pimpdadd",
    "salt": "RsYBEqQY",
    "md5": "d361c05bf7b4242847c68ff72bce1d86",
    "sha1": "1740bd446b29a9f5cad4f1cf0d883527fa632f1a",
    "sha256":
        "4b4e039f6b6e021c1b7769d55a4f8450b1ad7edec3b94ecb841567e03b8e6e2d",
  },
  "dob": {"date": "1957-11-29T02:18:54.064Z", "age": 68},
  "registered": {"date": "2004-04-16T06:53:15.490Z", "age": 21},
  "phone": "04-89-54-08-38",
  "cell": "06-47-80-37-03",
  "id": {"name": "INSEE", "value": "1571060634218 30"},
  "picture": {
    "large": "https://randomuser.me/api/portraits/men/89.jpg",
    "medium": "https://randomuser.me/api/portraits/med/men/89.jpg",
    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/89.jpg",
  },
  "nat": "FR",
};

final mockUserEntity = UserEntity.fromJson(mockJson['results'].first);

final mockJsonList = jsonEncode([mockUserJson, mockUserJson, mockUserJson]);

final mockUserList = [mockUserEntity, mockUserEntity, mockUserEntity];
