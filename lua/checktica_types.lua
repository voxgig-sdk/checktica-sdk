-- Typed models for the Checktica SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Detect
---@field aiProbability? number
---@field confidence? number
---@field humanProbability? number
---@field isAI? boolean
---@field text string

---@class DetectCreateData
---@field aiProbability? number
---@field confidence? number
---@field humanProbability? number
---@field isAI? boolean
---@field text string

local M = {}

return M
