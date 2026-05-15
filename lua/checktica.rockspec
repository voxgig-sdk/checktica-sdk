package = "voxgig-sdk-checktica"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/checktica-sdk.git"
}
description = {
  summary = "Checktica SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["checktica_sdk"] = "checktica_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
