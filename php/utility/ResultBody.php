<?php
declare(strict_types=1);

// Checktica SDK utility: result_body

class CheckticaResultBody
{
    public static function call(CheckticaContext $ctx): ?CheckticaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
