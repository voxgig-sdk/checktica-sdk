# Checktica SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module CheckticaFeatures
  def self.make_feature(name)
    case name
    when "base"
      CheckticaBaseFeature.new
    when "test"
      CheckticaTestFeature.new
    else
      CheckticaBaseFeature.new
    end
  end
end
