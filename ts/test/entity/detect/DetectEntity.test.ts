

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { CheckticaSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('DetectEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when CHECKTICA_TEST_LIVE=TRUE.
  afterEach(liveDelay('CHECKTICA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = CheckticaSDK.test()
    const ent = testsdk.Detect()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.CHECKTICA_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'detect.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"format":"float","name":"aiProbability","req":false,"short":"Probability that the text is AI-generated (0-100)","type":"`$NUMBER`","index$":0},{"active":true,"format":"float","name":"confidence","req":false,"short":"Confidence score of the detection (0-1)","type":"`$NUMBER`","index$":1},{"active":true,"format":"float","name":"humanProbability","req":false,"short":"Probability that the text is human-written (0-100)","type":"`$NUMBER`","index$":2},{"active":true,"name":"isAI","req":false,"short":"Indicates whether the text was identified as AI-generated","type":"`$BOOLEAN`","index$":3},{"active":true,"name":"text","req":true,"short":"The text to analyze for AI detection.","type":"`$STRING`","index$":4}],"name":"detect","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /detect","json":"{\"operationId\":\"detectAiText\",\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"text\":{\"description\":\"The text to analyze for AI detection. No length limitations.\",\"example\":\"This is a sample text that needs to be analyzed to determine if it was written by AI or a human.\",\"type\":\"string\"}},\"required\":[\"text\"],\"type\":\"object\"}}},\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"aiProbability\":99.2,\"confidence\":0.99,\"humanProbability\":0.8,\"isAI\":true},\"schema\":{\"properties\":{\"aiProbability\":{\"description\":\"Probability that the text is AI-generated (0-100)\",\"format\":\"float\",\"maximum\":100,\"minimum\":0,\"type\":\"number\"},\"confidence\":{\"description\":\"Confidence score of the detection (0-1)\",\"format\":\"float\",\"maximum\":1,\"minimum\":0,\"type\":\"number\"},\"humanProbability\":{\"description\":\"Probability that the text is human-written (0-100)\",\"format\":\"float\",\"maximum\":100,\"minimum\":0,\"type\":\"number\"},\"isAI\":{\"description\":\"Indicates whether the text was identified as AI-generated\",\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Successful detection response\"},\"400\":{\"content\":{\"application/json\":{\"example\":{\"error\":\"Text field is required\"},\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message describing what went wrong\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Bad request - invalid input\"},\"500\":{\"content\":{\"application/json\":{\"example\":{\"error\":\"An internal error occurred while processing your request\"},\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/detect","segments":[{"lit":"detect"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"detect","name__orig":"detect","Name":"Detect","name_":"detect","name-":"detect","NAME":"DETECT","index$":0}, {"active":true,"entity":"detect","key$":"BasicDetectFlow","kind":"basic","name":"BasicDetectFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"detect_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'Detect')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const detect_ref01_ent = client.Detect()
    let detect_ref01_data = setup.data.new.detect['detect_ref01']

    detect_ref01_data = (await detect_ref01_ent.create(detect_ref01_data)).data()
    assert(null != detect_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/detect/DetectTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = CheckticaSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['detect01','detect02','detect03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'CHECKTICA_TEST_DETECT_ENTID': idmap,
    'CHECKTICA_TEST_LIVE': 'FALSE',
    'CHECKTICA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['CHECKTICA_TEST_DETECT_ENTID']

  const live = 'TRUE' === env.CHECKTICA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['CHECKTICA_TEST_DETECT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new CheckticaSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.CHECKTICA_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
