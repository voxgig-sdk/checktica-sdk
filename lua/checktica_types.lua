-- Typed models for the Checktica SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Detect
---@field ai_probability? number
---@field confidence? number
---@field human_probability? number
---@field is_ai? boolean
---@field text string

---@class DetectCreateData

local M = {}

return M
