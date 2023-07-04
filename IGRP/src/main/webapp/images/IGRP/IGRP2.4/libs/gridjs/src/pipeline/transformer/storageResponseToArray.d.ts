import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
import { StorageResponse } from '../../storage/storage';
import { TCell, TwoDArray } from '../../types';
import Header from '../../header';
export interface ArrayResponse {
    data: TwoDArray<TCell>;
    total: number;
}
interface StorageResponseToArrayTransformerProps extends PipelineProcessorProps {
    header: Header;
}
declare class StorageResponseToArrayTransformer extends PipelineProcessor<ArrayResponse, StorageResponseToArrayTransformerProps> {
    get type(): ProcessorType;
    private castData;
    _process(storageResponse: StorageResponse): ArrayResponse;
}
export default StorageResponseToArrayTransformer;
