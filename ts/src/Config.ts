
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

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'Checktica',
        slug: "checktica",
    version: "0.0.1",
    target: "ts",

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
          "short": "Probability that the text is AI-generated (0-100)",
          "type": "`$NUMBER`"
        },
        {
          "name": "confidence",
          "short": "Confidence score of the detection (0-1)",
          "type": "`$NUMBER`"
        },
        {
          "name": "humanProbability",
          "short": "Probability that the text is human-written (0-100)",
          "type": "`$NUMBER`"
        },
        {
          "name": "isAI",
          "short": "Indicates whether the text was identified as AI-generated",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "text",
          "req": true,
          "short": "The text to analyze for AI detection.",
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

