<?php
declare(strict_types=1);

// Checktica SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class CheckticaFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new CheckticaBaseFeature();
            case "test":
                return new CheckticaTestFeature();
            default:
                return new CheckticaBaseFeature();
        }
    }
}
