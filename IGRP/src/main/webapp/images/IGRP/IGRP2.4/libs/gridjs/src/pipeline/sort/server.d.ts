import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
import { ServerStorageOptions } from '../../storage/server';
import { TColumnSort } from '../../types';
interface ServerSortProps extends PipelineProcessorProps {
    columns: TColumnSort[];
    url?: (prevUrl: string, columns: TColumnSort[]) => string;
    body?: (prevBody: BodyInit, columns: TColumnSort[]) => BodyInit;
}
declare class ServerSort extends PipelineProcessor<ServerStorageOptions, ServerSortProps> {
    get type(): ProcessorType;
    _process(options?: ServerStorageOptions): ServerStorageOptions;
}
export default ServerSort;
