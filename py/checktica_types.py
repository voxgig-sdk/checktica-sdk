# Typed models for the Checktica SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Detect:
    text: str
    ai_probability: Optional[float] = None
    confidence: Optional[float] = None
    human_probability: Optional[float] = None
    is_ai: Optional[bool] = None


@dataclass
class DetectCreateData:
    ai_probability: Optional[float] = None
    confidence: Optional[float] = None
    human_probability: Optional[float] = None
    is_ai: Optional[bool] = None
    text: Optional[str] = None

