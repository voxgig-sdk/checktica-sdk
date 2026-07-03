# Checktica SDK configuration


def make_config():
    return {
        "main": {
            "name": "Checktica",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.checktica.com/v1",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "detect": {},
            },
        },
        "entity": {
      "detect": {
        "fields": [
          {
            "active": True,
            "name": "ai_probability",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "confidence",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "human_probability",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "is_ai",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "text",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
        "name": "detect",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "POST",
                "orig": "/detect",
                "parts": [
                  "detect",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
