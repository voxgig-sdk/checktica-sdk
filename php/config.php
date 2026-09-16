<?php
declare(strict_types=1);

// Checktica SDK configuration

class CheckticaConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Checktica",
                "slug" => "checktica",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
            ],
            "options" => [
                "base" => "https://api.checktica.com/v1",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "detect" => [],
                ],
            ],
            "entity" => [
        'detect' => [
          'fields' => [
            [
              'format' => 'float',
              'name' => 'aiProbability',
              'short' => 'Probability that the text is AI-generated (0-100)',
              'type' => '`$NUMBER`',
            ],
            [
              'format' => 'float',
              'name' => 'confidence',
              'short' => 'Confidence score of the detection (0-1)',
              'type' => '`$NUMBER`',
            ],
            [
              'format' => 'float',
              'name' => 'humanProbability',
              'short' => 'Probability that the text is human-written (0-100)',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'isAI',
              'short' => 'Indicates whether the text was identified as AI-generated',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'text',
              'req' => true,
              'short' => 'The text to analyze for AI detection.',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'detect',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/detect',
                  'segments' => [
                    [
                      'lit' => 'detect',
                    ],
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'parts' => [
                    'detect',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return CheckticaFeatures::make_feature($name);
    }
}
