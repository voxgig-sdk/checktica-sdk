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
# @!attribute [rw] ai_probability
#   @return [Float, nil]
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] human_probability
#   @return [Float, nil]
#
# @!attribute [rw] is_ai
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String]
Detect = Struct.new(
  :ai_probability,
  :confidence,
  :human_probability,
  :is_ai,
  :text,
  keyword_init: true
)

# Match filter for Detect#create (any subset of Detect fields).
#
# @!attribute [rw] ai_probability
#   @return [Float, nil]
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] human_probability
#   @return [Float, nil]
#
# @!attribute [rw] is_ai
#   @return [Boolean, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
DetectCreateData = Struct.new(
  :ai_probability,
  :confidence,
  :human_probability,
  :is_ai,
  :text,
  keyword_init: true
)

