# ProjectName SDK exists test

import pytest
from checktica_sdk import CheckticaSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = CheckticaSDK.test(None, None)
        assert testsdk is not None
