# Checktica SDK utility: make_context
require_relative '../core/context'
module CheckticaUtilities
  MakeContext = ->(ctxmap, basectx) {
    CheckticaContext.new(ctxmap, basectx)
  }
end
