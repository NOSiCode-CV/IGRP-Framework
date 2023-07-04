import { PipelineProcessor, ProcessorType } from './processor';
import { EventEmitter } from '../util/eventEmitter';
interface PipelineEvents<T> {
    updated: (processor: PipelineProcessor<any, any>) => void;
    afterRegister: () => void;
    propsUpdated: () => void;
    afterProcess: (prev: T) => void;
    error: (prev: T) => void;
}
declare class Pipeline<T, P = unknown> extends EventEmitter<PipelineEvents<T>> {
    private readonly _steps;
    private cache;
    private lastProcessorIndexUpdated;
    constructor(steps?: PipelineProcessor<any, any>[]);
    clearCache(): void;
    register(processor: PipelineProcessor<any, any>, priority?: number): void;
    unregister(processor: PipelineProcessor<any, any>): void;
    private addProcessorByPriority;
    get steps(): PipelineProcessor<T, P>[];
    getStepsByType(type: ProcessorType): PipelineProcessor<T, P>[];
    private getSortedProcessorTypes;
    process(data?: T): Promise<T>;
    private findProcessorIndexByID;
    private setLastProcessorIndex;
    private processorPropsUpdated;
    private afterRegistered;
}
export default Pipeline;
