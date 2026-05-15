<?php
declare(strict_types=1);

// Checktica SDK base feature

class CheckticaBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(CheckticaContext $ctx, array $options): void {}
    public function PostConstruct(CheckticaContext $ctx): void {}
    public function PostConstructEntity(CheckticaContext $ctx): void {}
    public function SetData(CheckticaContext $ctx): void {}
    public function GetData(CheckticaContext $ctx): void {}
    public function GetMatch(CheckticaContext $ctx): void {}
    public function SetMatch(CheckticaContext $ctx): void {}
    public function PrePoint(CheckticaContext $ctx): void {}
    public function PreSpec(CheckticaContext $ctx): void {}
    public function PreRequest(CheckticaContext $ctx): void {}
    public function PreResponse(CheckticaContext $ctx): void {}
    public function PreResult(CheckticaContext $ctx): void {}
    public function PreDone(CheckticaContext $ctx): void {}
    public function PreUnexpected(CheckticaContext $ctx): void {}
}
