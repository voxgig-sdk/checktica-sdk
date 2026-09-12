"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'Checktica',
        slug: "checktica",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://api.checktica.com/v1",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            detect: {},
        }
    };
    entity = {
        "detect": {
            "fields": [
                {
                    "format": "float",
                    "name": "aiProbability",
                    "short": "Probability that the text is AI-generated (0-100)",
                    "type": "`$NUMBER`"
                },
                {
                    "format": "float",
                    "name": "confidence",
                    "short": "Confidence score of the detection (0-1)",
                    "type": "`$NUMBER`"
                },
                {
                    "format": "float",
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
                            "segments": [
                                {
                                    "lit": "detect"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "detect"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map