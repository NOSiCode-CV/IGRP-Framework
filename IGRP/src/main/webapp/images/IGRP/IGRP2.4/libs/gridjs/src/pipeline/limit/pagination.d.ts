import Tabular from '../../tabular';
import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
interface PaginationLimitProps extends PipelineProcessorProps {
    page: number;
    limit: number;
}
declare class PaginationLimit extends PipelineProcessor<Tabular, PaginationLimitProps> {
    protected validateProps(): void;
    get type(): ProcessorType;
    protected _process(data: Tabular): Tabular;
}
export default PaginationLimit;
