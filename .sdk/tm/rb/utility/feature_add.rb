# Checktica SDK utility: feature_add
module CheckticaUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
