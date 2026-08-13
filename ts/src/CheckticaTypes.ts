// Typed models for the Checktica SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Detect {
  aiProbability?: number
  confidence?: number
  humanProbability?: number
  isAI?: boolean
  text: string
}

export interface DetectCreateData {
  aiProbability?: number
  confidence?: number
  humanProbability?: number
  isAI?: boolean
  text: string
}

