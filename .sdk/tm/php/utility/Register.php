<?php
declare(strict_types=1);

// Checktica SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

CheckticaUtility::setRegistrar(function (CheckticaUtility $u): void {
    $u->clean = [CheckticaClean::class, 'call'];
    $u->done = [CheckticaDone::class, 'call'];
    $u->make_error = [CheckticaMakeError::class, 'call'];
    $u->feature_add = [CheckticaFeatureAdd::class, 'call'];
    $u->feature_hook = [CheckticaFeatureHook::class, 'call'];
    $u->feature_init = [CheckticaFeatureInit::class, 'call'];
    $u->fetcher = [CheckticaFetcher::class, 'call'];
    $u->make_fetch_def = [CheckticaMakeFetchDef::class, 'call'];
    $u->make_context = [CheckticaMakeContext::class, 'call'];
    $u->make_options = [CheckticaMakeOptions::class, 'call'];
    $u->make_request = [CheckticaMakeRequest::class, 'call'];
    $u->make_response = [CheckticaMakeResponse::class, 'call'];
    $u->make_result = [CheckticaMakeResult::class, 'call'];
    $u->make_point = [CheckticaMakePoint::class, 'call'];
    $u->make_spec = [CheckticaMakeSpec::class, 'call'];
    $u->make_url = [CheckticaMakeUrl::class, 'call'];
    $u->param = [CheckticaParam::class, 'call'];
    $u->prepare_auth = [CheckticaPrepareAuth::class, 'call'];
    $u->prepare_body = [CheckticaPrepareBody::class, 'call'];
    $u->prepare_headers = [CheckticaPrepareHeaders::class, 'call'];
    $u->prepare_method = [CheckticaPrepareMethod::class, 'call'];
    $u->prepare_params = [CheckticaPrepareParams::class, 'call'];
    $u->prepare_path = [CheckticaPreparePath::class, 'call'];
    $u->prepare_query = [CheckticaPrepareQuery::class, 'call'];
    $u->result_basic = [CheckticaResultBasic::class, 'call'];
    $u->result_body = [CheckticaResultBody::class, 'call'];
    $u->result_headers = [CheckticaResultHeaders::class, 'call'];
    $u->transform_request = [CheckticaTransformRequest::class, 'call'];
    $u->transform_response = [CheckticaTransformResponse::class, 'call'];
});
