<?php
declare(strict_types=1);

// Checktica SDK utility: feature_add

class CheckticaFeatureAdd
{
    public static function call(CheckticaContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
