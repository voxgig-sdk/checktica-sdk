<?php
declare(strict_types=1);

// Checktica SDK exists test

require_once __DIR__ . '/../checktica_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = CheckticaSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
