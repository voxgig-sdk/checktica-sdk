import { Context } from './Context';
declare class CheckticaError extends Error {
    isCheckticaError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { CheckticaError };
