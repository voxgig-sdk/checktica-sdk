package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Checktica",
			"slug": "checktica",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.checktica.com/v1",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"detect": map[string]any{},
			},
		},
		"entity": map[string]any{
			"detect": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "aiProbability",
						"short": "Probability that the text is AI-generated (0-100)",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "confidence",
						"short": "Confidence score of the detection (0-1)",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "humanProbability",
						"short": "Probability that the text is human-written (0-100)",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "isAI",
						"short": "Indicates whether the text was identified as AI-generated",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "text",
						"req": true,
						"short": "The text to analyze for AI detection.",
						"type": "`$STRING`",
					},
				},
				"name": "detect",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/detect",
								"parts": []any{
									"detect",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
