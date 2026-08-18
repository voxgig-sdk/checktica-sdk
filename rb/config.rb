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
              "type" => "`$NUMBER`",
            },
            {
              "name" => "confidence",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "humanProbability",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "isAI",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "text",
              "req" => true,
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
