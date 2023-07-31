import Storage, { StorageResponse } from './storage';
export interface ServerStorageOptions extends RequestInit {
    url: string;
    then?: (data: any) => any[][];
    handle?: (response: Response) => Promise<any>;
    total?: (data: any) => number;
    data?: (opts: ServerStorageOptions) => Promise<StorageResponse>;
}
declare class ServerStorage extends Storage<ServerStorageOptions> {
    private readonly options;
    constructor(options: ServerStorageOptions);
    private handler;
    get(options?: ServerStorageOptions): Promise<StorageResponse>;
}
export default ServerStorage;
