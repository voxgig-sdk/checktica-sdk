
import { Context } from './Context'


class CheckticaError extends Error {

  isCheckticaError = true

  sdk = 'Checktica'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  CheckticaError
}

