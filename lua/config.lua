-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "Checktica",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.checktica.com/v1",
      auth = {
        prefix = "Bearer",
      },
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
            ["active"] = true,
            ["name"] = "ai_probability",
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "confidence",
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "human_probability",
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "is_ai",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "text",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
        },
        ["name"] = "detect",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
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
                ["index$"] = 0,
              },
            },
            ["key$"] = "create",
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
