# Checktica SDK feature factory

from checktica_sdk.feature.base_feature import CheckticaBaseFeature
from checktica_sdk.feature.test_feature import CheckticaTestFeature


_FEATURES = {
    "base": lambda: CheckticaBaseFeature(),
    "test": lambda: CheckticaTestFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
