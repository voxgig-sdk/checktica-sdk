# Checktica SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module CheckticaFeatures
  def self.make_feature(name)
    case name
    when "base"
      CheckticaBaseFeature.new
    when "ratelimit"
      CheckticaRatelimitFeature.new
    when "retry"
      CheckticaRetryFeature.new
    when "test"
      CheckticaTestFeature.new
    when "timeout"
      CheckticaTimeoutFeature.new
    else
      CheckticaBaseFeature.new
    end
  end
end
