
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'Checktica',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://api.checktica.com/v1",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      detect: {
      },

    }
  }


  entity = {
    "detect": {
      "fields": [
        {
          "name": "aiProbability",
          "type": "`$NUMBER`"
        },
        {
          "name": "confidence",
          "type": "`$NUMBER`"
        },
        {
          "name": "humanProbability",
          "type": "`$NUMBER`"
        },
        {
          "name": "isAI",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "text",
          "req": true,
          "type": "`$STRING`"
        }
      ],
      "name": "detect",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/detect",
              "parts": [
                "detect"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

