import { PipelineProcessor, PipelineProcessorProps, ProcessorType } from '../processor';
import { ServerStorageOptions } from '../../storage/server';
interface ServerInitiatorProps extends PipelineProcessorProps {
    serverStorageOptions: ServerStorageOptions;
}
declare class ServerInitiator extends PipelineProcessor<ServerStorageOptions, ServerInitiatorProps> {
    get type(): ProcessorType;
    _process(): ServerStorageOptions;
}
export default ServerInitiator;
