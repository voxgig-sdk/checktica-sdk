import { CheckticaEntityBase } from '../CheckticaEntityBase';
import type { CheckticaSDK } from '../CheckticaSDK';
import type { Control } from '../types';
import type { Detect, DetectCreateData } from '../CheckticaTypes';
declare class DetectEntity extends CheckticaEntityBase<Detect> {
    constructor(client: CheckticaSDK, entopts: any);
    make(this: DetectEntity): DetectEntity;
    create(this: any, reqdata?: DetectCreateData, ctrl?: Control): Promise<DetectEntity>;
}
export { DetectEntity };
