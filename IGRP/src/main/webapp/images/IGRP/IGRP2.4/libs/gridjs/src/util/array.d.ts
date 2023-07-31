import { OneDArray, TwoDArray } from '../types';
export declare function oneDtoTwoD<T>(data: OneDArray<T> | TwoDArray<T>): TwoDArray<T>;
export declare function flatten<T>(arrays: TwoDArray<T>): OneDArray<T>;
