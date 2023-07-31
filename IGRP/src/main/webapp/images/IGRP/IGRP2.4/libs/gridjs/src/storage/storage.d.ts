import { TData } from '../types';
declare abstract class Storage<I> {
    abstract get(...args: any[]): Promise<StorageResponse>;
    set?(data: I | ((...args: any[]) => void)): this;
}
export interface StorageResponse {
    data: TData;
    total: number;
}
export default Storage;
