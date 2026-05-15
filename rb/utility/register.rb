# Checktica SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

CheckticaUtility.registrar = ->(u) {
  u.clean = CheckticaUtilities::Clean
  u.done = CheckticaUtilities::Done
  u.make_error = CheckticaUtilities::MakeError
  u.feature_add = CheckticaUtilities::FeatureAdd
  u.feature_hook = CheckticaUtilities::FeatureHook
  u.feature_init = CheckticaUtilities::FeatureInit
  u.fetcher = CheckticaUtilities::Fetcher
  u.make_fetch_def = CheckticaUtilities::MakeFetchDef
  u.make_context = CheckticaUtilities::MakeContext
  u.make_options = CheckticaUtilities::MakeOptions
  u.make_request = CheckticaUtilities::MakeRequest
  u.make_response = CheckticaUtilities::MakeResponse
  u.make_result = CheckticaUtilities::MakeResult
  u.make_point = CheckticaUtilities::MakePoint
  u.make_spec = CheckticaUtilities::MakeSpec
  u.make_url = CheckticaUtilities::MakeUrl
  u.param = CheckticaUtilities::Param
  u.prepare_auth = CheckticaUtilities::PrepareAuth
  u.prepare_body = CheckticaUtilities::PrepareBody
  u.prepare_headers = CheckticaUtilities::PrepareHeaders
  u.prepare_method = CheckticaUtilities::PrepareMethod
  u.prepare_params = CheckticaUtilities::PrepareParams
  u.prepare_path = CheckticaUtilities::PreparePath
  u.prepare_query = CheckticaUtilities::PrepareQuery
  u.result_basic = CheckticaUtilities::ResultBasic
  u.result_body = CheckticaUtilities::ResultBody
  u.result_headers = CheckticaUtilities::ResultHeaders
  u.transform_request = CheckticaUtilities::TransformRequest
  u.transform_response = CheckticaUtilities::TransformResponse
}
