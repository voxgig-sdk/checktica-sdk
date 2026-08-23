# Checktica SDK configuration

module CheckticaConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Checktica",
        "slug" => "checktica",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.checktica.com/v1",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "detect" => {},
        },
      },
      "entity" => {
        "detect" => {
          "fields" => [
            {
              "name" => "aiProbability",
              "short" => "Probability that the text is AI-generated (0-100)",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "confidence",
              "short" => "Confidence score of the detection (0-1)",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "humanProbability",
              "short" => "Probability that the text is human-written (0-100)",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "isAI",
              "short" => "Indicates whether the text was identified as AI-generated",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "text",
              "req" => true,
              "short" => "The text to analyze for AI detection.",
              "type" => "`$STRING`",
            },
          ],
          "name" => "detect",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/detect",
                  "parts" => [
                    "detect",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    CheckticaFeatures.make_feature(name)
  end
end
