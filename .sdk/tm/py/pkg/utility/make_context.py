# Checktica SDK utility: make_context

from projectname_sdk.core.context import CheckticaContext


def make_context_util(ctxmap, basectx):
    return CheckticaContext(ctxmap, basectx)
