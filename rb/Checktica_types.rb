# frozen_string_literal: true

# Typed models for the Checktica SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Detect entity data model.
#
# @!attribute [rw] aiProbability
#   @return [Float, nil]
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] humanProbability
#   @return [Float, nil]
#
# @!attribute [rw] isAI
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String]
Detect = Struct.new(
  :aiProbability,
  :confidence,
  :humanProbability,
  :isAI,
  :text,
  keyword_init: true
)

# Request payload for Detect#create.
#
# @!attribute [rw] aiProbability
#   @return [Float, nil]
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] humanProbability
#   @return [Float, nil]
#
# @!attribute [rw] isAI
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String]
DetectCreateData = Struct.new(
  :aiProbability,
  :confidence,
  :humanProbability,
  :isAI,
  :text,
  keyword_init: true
)

