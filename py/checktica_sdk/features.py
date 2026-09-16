# Checktica SDK feature factory

from checktica_sdk.feature.base_feature import CheckticaBaseFeature
from checktica_sdk.feature.ratelimit_feature import CheckticaRatelimitFeature
from checktica_sdk.feature.retry_feature import CheckticaRetryFeature
from checktica_sdk.feature.test_feature import CheckticaTestFeature
from checktica_sdk.feature.timeout_feature import CheckticaTimeoutFeature


_FEATURES = {
    "base": lambda: CheckticaBaseFeature(),
    "ratelimit": lambda: CheckticaRatelimitFeature(),
    "retry": lambda: CheckticaRetryFeature(),
    "test": lambda: CheckticaTestFeature(),
    "timeout": lambda: CheckticaTimeoutFeature(),
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
