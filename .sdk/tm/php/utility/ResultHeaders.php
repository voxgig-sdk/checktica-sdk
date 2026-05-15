<?php
declare(strict_types=1);

// Checktica SDK utility: result_headers

class CheckticaResultHeaders
{
    public static function call(CheckticaContext $ctx): ?CheckticaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
