<?php
declare(strict_types=1);

// Checktica SDK configuration

class CheckticaConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Checktica",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.checktica.com/v1",
                "auth" => [
                    "prefix" => "Bearer",
                ],
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
              'name' => 'ai_probability',
              'req' => false,
              'type' => '`$NUMBER`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'confidence',
              'req' => false,
              'type' => '`$NUMBER`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'human_probability',
              'req' => false,
              'type' => '`$NUMBER`',
              'active' => true,
              'index$' => 2,
            ],
            [
              'name' => 'is_ai',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'active' => true,
              'index$' => 3,
            ],
            [
              'name' => 'text',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 4,
            ],
          ],
          'name' => 'detect',
          'op' => [
            'create' => [
              'name' => 'create',
              'points' => [
                [
                  'method' => 'POST',
                  'orig' => '/detect',
                  'parts' => [
                    'detect',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'create',
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
