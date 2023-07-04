import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
import { ServerStorageOptions } from '../../storage/server';
interface ServerGlobalSearchFilterProps extends PipelineProcessorProps {
    keyword?: string;
    url?: (prevUrl: string, keyword: string) => string;
    body?: (prevBody: BodyInit, keyword: string) => BodyInit;
}
declare class ServerGlobalSearchFilter extends PipelineProcessor<ServerStorageOptions, ServerGlobalSearchFilterProps> {
    get type(): ProcessorType;
    _process(options?: ServerStorageOptions): ServerStorageOptions;
}
export default ServerGlobalSearchFilter;
