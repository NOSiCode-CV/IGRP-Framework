import { Comparator, TCell } from '../../types';
import Tabular from '../../tabular';
import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
interface NativeSortProps extends PipelineProcessorProps {
    columns: {
        index: number;
        direction?: 1 | -1;
        compare?: Comparator<TCell>;
    }[];
}
declare class NativeSort extends PipelineProcessor<Tabular, NativeSortProps> {
    protected validateProps(): void;
    get type(): ProcessorType;
    private compare;
    private compareWrapper;
    protected _process(data: Tabular): Tabular;
}
export default NativeSort;
