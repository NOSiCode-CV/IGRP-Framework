import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
import { ServerStorageOptions } from '../../storage/server';
interface ServerPaginationLimitProps extends PipelineProcessorProps {
    page: number;
    limit: number;
    url?: (prevUrl: string, page: number, limit: number) => string;
    body?: (prevBody: BodyInit, page: number, limit: number) => BodyInit;
}
declare class ServerPaginationLimit extends PipelineProcessor<ServerStorageOptions, ServerPaginationLimitProps> {
    get type(): ProcessorType;
    _process(options?: ServerStorageOptions): ServerStorageOptions;
}
export default ServerPaginationLimit;
