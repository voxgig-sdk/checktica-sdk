package core

type CheckticaError struct {
	IsCheckticaError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewCheckticaError(code string, msg string, ctx *Context) *CheckticaError {
	return &CheckticaError{
		IsCheckticaError: true,
		Sdk:              "Checktica",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *CheckticaError) Error() string {
	return e.Msg
}
