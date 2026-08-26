-- Checktica SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "Checktica",
      slug = "checktica",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://api.checktica.com/v1",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["detect"] = {},
      },
    },
    entity = {
      ["detect"] = {
        ["fields"] = {
          {
            ["name"] = "aiProbability",
            ["short"] = "Probability that the text is AI-generated (0-100)",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "confidence",
            ["short"] = "Confidence score of the detection (0-1)",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "humanProbability",
            ["short"] = "Probability that the text is human-written (0-100)",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "isAI",
            ["short"] = "Indicates whether the text was identified as AI-generated",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "text",
            ["req"] = true,
            ["short"] = "The text to analyze for AI detection.",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "detect",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/detect",
                ["parts"] = {
                  "detect",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
