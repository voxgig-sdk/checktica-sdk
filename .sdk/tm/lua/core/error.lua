-- Checktica SDK error

local CheckticaError = {}
CheckticaError.__index = CheckticaError


function CheckticaError.new(code, msg, ctx)
  local self = setmetatable({}, CheckticaError)
  self.is_sdk_error = true
  self.sdk = "Checktica"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function CheckticaError:error()
  return self.msg
end


function CheckticaError:__tostring()
  return self.msg
end


return CheckticaError
