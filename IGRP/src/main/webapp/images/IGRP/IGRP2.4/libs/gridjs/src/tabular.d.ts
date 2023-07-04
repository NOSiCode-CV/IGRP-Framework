import Base from './base';
import Row from './row';
import { OneDArray, TCell, TwoDArray } from './types';
declare class Tabular extends Base {
    private _rows;
    private _length;
    constructor(rows?: Row[] | Row);
    get rows(): Row[];
    set rows(rows: Row[]);
    get length(): number;
    set length(len: number);
    toArray(): TCell[][];
    static fromRows(rows: Row[]): Tabular;
    static fromArray<T extends TCell>(data: OneDArray<T> | TwoDArray<T>): Tabular;
}
export default Tabular;
