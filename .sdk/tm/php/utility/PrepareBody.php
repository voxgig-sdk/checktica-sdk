<?php
declare(strict_types=1);

// Checktica SDK utility: prepare_body

class CheckticaPrepareBody
{
    public static function call(CheckticaContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
