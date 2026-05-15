# Checktica SDK feature factory

from feature.base_feature import CheckticaBaseFeature
from feature.test_feature import CheckticaTestFeature


def _make_feature(name):
    features = {
        "base": lambda: CheckticaBaseFeature(),
        "test": lambda: CheckticaTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
