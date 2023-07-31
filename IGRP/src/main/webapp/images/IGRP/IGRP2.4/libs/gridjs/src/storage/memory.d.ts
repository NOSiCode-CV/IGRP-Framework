import Storage, { StorageResponse } from './storage';
import { TData } from '../types';
declare class MemoryStorage extends Storage<TData> {
    private data;
    constructor(data: TData | (() => TData) | (() => Promise<TData>));
    get(): Promise<StorageResponse>;
    set(data: TData | (() => TData) | (() => Promise<TData>)): this;
}
export default MemoryStorage;
