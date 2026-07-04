// Typed models for the Checktica SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Detect {
  ai_probability?: number
  confidence?: number
  human_probability?: number
  is_ai?: boolean
  text: string
}

export type DetectCreateData = Partial<Detect>

