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
              'active' => true,
              'name' => 'ai_probability',
              'req' => false,
              'type' => '`$NUMBER`',
              'index$' => 0,
            ],
            [
              'active' => true,
              'name' => 'confidence',
              'req' => false,
              'type' => '`$NUMBER`',
              'index$' => 1,
            ],
            [
              'active' => true,
              'name' => 'human_probability',
              'req' => false,
              'type' => '`$NUMBER`',
              'index$' => 2,
            ],
            [
              'active' => true,
              'name' => 'is_ai',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'index$' => 3,
            ],
            [
              'active' => true,
              'name' => 'text',
              'req' => true,
              'type' => '`$STRING`',
              'index$' => 4,
            ],
          ],
          'name' => 'detect',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'POST',
                  'orig' => '/detect',
                  'parts' => [
                    'detect',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
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
