import Cell from './cell';
import Base from './base';
import { TCell } from './types';
declare class Row extends Base {
    private _cells;
    constructor(cells?: Cell[]);
    cell(index: number): Cell;
    get cells(): Cell[];
    set cells(cells: Cell[]);
    toArray(): TCell[];
    static fromCells(cells: Cell[]): Row;
    get length(): number;
}
export default Row;
