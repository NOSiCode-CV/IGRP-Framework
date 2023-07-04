import { ID } from '../util/id';
import { EventEmitter } from '../util/eventEmitter';
export declare enum ProcessorType {
    Initiator = 0,
    ServerFilter = 1,
    ServerSort = 2,
    ServerLimit = 3,
    Extractor = 4,
    Transformer = 5,
    Filter = 6,
    Sort = 7,
    Limit = 8
}
interface PipelineProcessorEvents<T, P> {
    propsUpdated: (processor: PipelineProcessor<T, P>) => void;
    beforeProcess: (...args: any[]) => void;
    afterProcess: (...args: any[]) => void;
}
export interface PipelineProcessorProps {
}
export declare abstract class PipelineProcessor<T, P extends Partial<PipelineProcessorProps>> extends EventEmitter<PipelineProcessorEvents<T, P>> {
    readonly id: ID;
    private readonly _props;
    abstract get type(): ProcessorType;
    protected abstract _process(...args: any[]): T | Promise<T>;
    protected validateProps?(...args: any[]): void;
    constructor(props?: Partial<P>);
    process(...args: any[]): T | Promise<T>;
    setProps(props: Partial<P>): this;
    get props(): P;
}
export {};
