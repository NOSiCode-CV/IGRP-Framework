import { UserConfig } from '../config';
import Storage from './storage';
declare class StorageUtils {
    static createFromUserConfig(userConfig: UserConfig): Storage<any>;
    static tableElementToArray(element: HTMLElement): any[][];
}
export default StorageUtils;
